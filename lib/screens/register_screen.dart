import 'package:eten/widgets/authentication_card.dart';
import 'package:flutter/material.dart';
import 'package:eten/widgets/blurred_image.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          BlurredImage(imageURL: 'Assets/Favorites.png'),
          Center(
            child: AuthCard(
              topText: 'Register',
              formTextList: [
                'Username',
                'E-mail',
                'Password',
                'Confirm Password'
              ],
              buttonText: 'Confirm',
              textButtonText: 'Already have an account? Sign in.',
            ),
          ),
        ],
      ),
    );
  }
}
