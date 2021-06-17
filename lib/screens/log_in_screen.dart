import 'package:eten/widgets/authentication_card.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: AuthCard(
          topText: 'Log In',
          formTextList: ['Username', 'Password'],
          buttonText: 'Confirm',
          textButtonText: 'Don\'t have an account? Register',
        ),
      ),
    );
  }
}
