import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eten/providers/themeProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatefulWidget {
  FavoriteButton(
      {required this.title,
      required this.imageURL,
      required this.id,
      this.refreshFn = defaultFn,
      Key? key})
      : super(key: key);
  final String imageURL;
  final String title;
  final String id;
  final Function refreshFn;
  static void defaultFn() {}

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = false;

  @override
  void initState() {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .collection('favorites')
        .doc(widget.id)
        .get()
        .then((value) {
      print(widget.title + ' ye' + value['title']);
      setState(() {
        isFavorited = true;
      });
    }).catchError((err) {
      print(widget.title + ' nop');
      setState(() {
        isFavorited = false;
      });
    });
    super.initState();
  }

  void addToFavorites() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser!.uid)
          .collection('favorites')
          .doc(widget.id)
          .set({
        'title': widget.title,
        'imageURL': widget.imageURL,
        'id': widget.id
      });

      var ref = await FirebaseFirestore.instance
          .collection('favorites')
          .doc(widget.id)
          .get();

      if (ref.exists)
        await FirebaseFirestore.instance
            .collection('favorites')
            .doc(widget.id)
            .set({'id': ref['id'], 'count': ref['count'] + 1, 'title':ref['title'], 'imageURL':ref['imageURL']});
      else
        await FirebaseFirestore.instance
            .collection('favorites')
            .doc(widget.id)
            .set({'id': widget.id, 'count': 1, 'title':widget.title, 'imageURL':widget.imageURL});
    }
    catch (err){
      print(err);
    }

    widget.refreshFn();
  }

  void removeFromFavorites() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .collection('favorites')
        .doc(widget.id)
        .delete();


      var ref = await FirebaseFirestore.instance
          .collection('favorites')
          .doc(widget.id)
          .get();

      if (ref['count'] == 1)
        FirebaseFirestore.instance
            .collection('favorites')
            .doc(widget.id)
            .delete();
      else
        FirebaseFirestore.instance
            .collection('favorites')
            .doc(widget.id)
            .set({'id': ref['id'], 'count': ref['count'] - 1, 'title':ref['title'], 'imageURL':ref['imageURL']});
    } catch (err) {
      print(err);
    }

    widget.refreshFn();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
          return IconButton(
            icon: Icon(isFavorited ? Icons.star : Icons.star_outline),
            onPressed: () {
              if (isFavorited)
                removeFromFavorites();
              else
                addToFavorites();
              setState(() {
                isFavorited = !isFavorited;
              });
            },
            visualDensity: VisualDensity.compact,
            iconSize: 24,
            splashRadius: 16,
            alignment: Alignment.center,
            color: Colors.yellow[700],
          );
        }
        return IconButton(
          icon: Icon(isFavorited ? Icons.star : Icons.star_outline),
          onPressed: () {
            ScaffoldMessenger.of(ctx).showSnackBar(
              SnackBar(
                content: Text('Please sign-in in order to favorite recipes.'),
                backgroundColor: Provider.of<ThemeInfo>(context, listen: false)
                            .chosenTheme ==
                        ThemeMode.light
                    ? Colors.teal[100]
                    : Colors.teal[900],
              ),
            );
          },
          visualDensity: VisualDensity.compact,
          iconSize: 24,
          splashRadius: 16,
          alignment: Alignment.center,
          color: Colors.yellow[700],
        );
      },
    );
  }
}
