import 'package:eten/screens/favorites_logged_out.dart';
import 'package:eten/widgets/favorite_results.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  static const String routeName = '/favorites';

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Favorites'),
              actions: [
                IconButton(
                  icon: Icon(Icons.star),
                  onPressed: null,
                  disabledColor: Colors.yellow,
                ),
              ],
            ),
            body: FavoriteResults(),
          );
        }
        if (userSnapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();
        return FavoritesLoggedOutScreen();
      },
    );
  }
}
