import 'package:eten/screens/favorites_logged_out.dart';
import 'package:eten/widgets/search_results.dart';
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
            body: SearchResults(
              hasNoTitle: true,
            ),
          );
        }
        if(userSnapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();
        return FavoritesLoggedOutScreen();
      },
    );
  }
}
