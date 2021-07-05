import 'package:eten/screens/favorites_logged_out_screen.dart';
import 'package:eten/screens/favorites_logged_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  static const String routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
          return FavoritesLoggedInScreen();
        }
        if (userSnapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();
        return FavoritesLoggedOutScreen();
      },
    );
  }
}
