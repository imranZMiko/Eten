import 'package:eten/widgets/authentication_card.dart';
import 'package:eten/widgets/blurred_image.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          BlurredImage(imageURL: 'Assets/Place4.png'),
          Center(
            child: AuthCard(
              topText: 'Sign In',
              formTextList: ['Username', 'Password'],
              buttonText: 'Confirm',
              textButtonText: 'Don\'t have an account? Register',
            ),
          ),
        ],
      ),
    );
  }
}
