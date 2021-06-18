import 'package:eten/screens/register_screen.dart';
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
                topText: 'Sign In',
                formTextList: ['Username', 'Password'],
                buttonText: 'Confirm',
                textButtonText: 'Don\'t have an account? Register',
                navigatorHandler: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          RegisterScreen(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
