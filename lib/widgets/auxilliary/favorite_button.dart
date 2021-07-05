import 'package:eten/providers/favoritesProvider.dart';
import 'package:eten/providers/themeProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatefulWidget {
  FavoriteButton(
      {required this.title, required this.imageURL, required this.id, Key? key})
      : super(key: key);
  final String imageURL;
  final String title;
  final String id;

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
          return FutureBuilder(
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                isFavorited = (snapshot.data! as bool);
                return IconButton(
                  icon: Icon(isFavorited ? Icons.star : Icons.star_outline),
                  onPressed: () async {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                    if (!isFavorited)
                      await Provider.of<Favorites>(context, listen: false)
                          .removeFromFavorites(widget.id);
                    else
                      await Provider.of<Favorites>(context, listen: false)
                          .addToFavorites(
                              widget.title, widget.id, widget.imageURL);
                  },
                  visualDensity: VisualDensity.compact,
                  iconSize: 24,
                  splashRadius: 16,
                  alignment: Alignment.center,
                  color: Colors.yellow[700],
                );
              }
              return IconButton(
                icon: Icon(Icons.star_outline),
                onPressed: () {},
                visualDensity: VisualDensity.compact,
                iconSize: 24,
                splashRadius: 16,
                alignment: Alignment.center,
                color: Colors.yellow[700],
              );
            },
            future: Provider.of<Favorites>(context, listen: false)
                .isFavorite(widget.id),
          );
        }
        return IconButton(
          icon: Icon(Icons.star_outline),
          onPressed: () {
            ScaffoldMessenger.of(ctx).showSnackBar(
              SnackBar(
                content: Text('Please sign-in in order to favorite recipes.'),
                backgroundColor: Provider.of<ThemeInfo>(context, listen: false)
                            .chosenTheme ==
                        ThemeMode.light
                    ? Colors.teal[100]
                    : Colors.teal[800],
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
