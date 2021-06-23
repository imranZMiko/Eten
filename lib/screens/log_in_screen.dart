import 'package:eten/screens/register_screen.dart';
import 'package:eten/widgets/blurred_image.dart';
import 'package:eten/widgets/log_in_card.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
    BuildContext ctx,
  ) async {
    try {
      setState(
        () {
          _isLoading = true;
        },
      );

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on PlatformException catch (err) {
      var message = 'An error occurred, please check your credentials!';

      if (err.message != null) {
        message = err.message!;
      }

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(
        () {
          _isLoading = false;
        },
      );
    } catch (err) {
      print(err);
      setState(
        () {
          _isLoading = false;
        },
      );
    }
  }

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
            child: LogInCard(
              navigatorHandler: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        RegisterScreen(),
                    transitionDuration: Duration(seconds: 0),
                  ),
                );
              },
              submitFn: _submitAuthForm,
              isLoading: _isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
