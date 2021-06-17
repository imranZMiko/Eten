import 'package:eten/widgets/authentication_card.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
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
            ),
          ),
        ],
      ),
    );
  }
}
