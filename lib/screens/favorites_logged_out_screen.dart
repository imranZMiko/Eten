import 'package:eten/widgets/authentication/authcard_logged_out.dart';
import 'package:flutter/material.dart';
import 'package:eten/widgets/auxilliary/blurred_image.dart';

class FavoritesLoggedOutScreen extends StatelessWidget {
  const FavoritesLoggedOutScreen({Key? key}) : super(key: key);

  static const String routeName = '/favorites/loggedout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          BlurredImage(imageURL: 'Assets/Favorites.png'),
          Positioned(
            top: 65,
            left: 20,
            child: Container(
              height: 45,
              width: 45,
              child: Image.asset('Assets/LogoWithoutEdge.png'),
            ),
          ),
          LoggedOutCard(
            title: 'Please sign in or register to view favorites',
          ),
        ],
      ),
    );
  }
}
