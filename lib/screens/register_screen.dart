import 'package:eten/screens/log_in_screen.dart';
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
          Positioned(
            top: 65,
            left: 20,
            child: Container(
              height: 45,
              width: 45,
              child: Image.asset('Assets/LogoWithoutEdge.png'),
            ),
          ),
          Center(
            child: AuthCard(
              topText: 'Register',
              formTextList: [
                'Username',
                'Name',
                'E-mail',
                'Password',
                'Confirm Password'
              ],
              buttonText: 'Confirm',
              textButtonText: 'Already have an account? Sign in.',
              navigatorHandler: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => LogInScreen(),
                    transitionDuration: Duration(seconds: 0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
