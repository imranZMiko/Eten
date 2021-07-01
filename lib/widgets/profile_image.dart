import 'package:eten/providers/themeProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  bool isLoading = false;

  _imgFromGallery(BuildContext ctx) async {
    setState(() {
      isLoading = true;
    });

    PickedFile? image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    var firebaseUser = FirebaseAuth.instance.currentUser;

    File imageFile = File(image!.path);

    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child(firebaseUser!.uid + '.jpg');

    try {
      await ref.delete().whenComplete(() => null);
      await ref.putFile(imageFile).whenComplete(() => null);

      setState(() {
        isLoading = false;
      });
    } on FirebaseException catch (err) {
      if (err.code == 'object-not-found') {
        await ref.putFile(imageFile).whenComplete(() => null);

        setState(() {
          isLoading = false;
        });
      }
    } catch (err) {
      print(err);
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(err.toString()),
          backgroundColor:
              Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
                      ThemeMode.light
                  ? Colors.teal[100]
                  : Colors.teal[900],
        ),
      );
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isLoading)
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Theme.of(context).backgroundColor,
                child: CircularProgressIndicator(),
                radius: 75,
              ),
            ),
          ),
        if (!isLoading)
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: FutureBuilder(
                future: FirebaseStorage.instance
                    .ref()
                    .child('user_image')
                    .child(FirebaseAuth.instance.currentUser!.uid + '.jpg')
                    .getDownloadURL(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CircleAvatar(
                      backgroundColor: Theme.of(context).backgroundColor,
                      child: IconButton(
                        icon: Icon(Icons.person),
                        iconSize: 90,
                        onPressed: null,
                      ),
                      radius: 75,
                    );
                  if (snapshot.hasData)
                    return CircleAvatar(
                      backgroundColor: Theme.of(context).backgroundColor,
                      backgroundImage: NetworkImage(snapshot.data! as String),
                      radius: 75,
                    );
                  return CircleAvatar(
                    backgroundColor: Theme.of(context).backgroundColor,
                    child: IconButton(
                      icon: Icon(Icons.person),
                      iconSize: 90,
                      onPressed: null,
                    ),
                    radius: 75,
                  );
                },
              ),
            ),
          ),
        if (!isLoading)
          Positioned(
            bottom: -10,
            right: MediaQuery.of(context).size.width / 2.0 - 95,
            child: IconButton(
              icon: Icon(Icons.edit),
              splashRadius: 20,
              onPressed: () {
                _imgFromGallery(context);
              },
            ),
          ),
      ],
    );
  }
}
