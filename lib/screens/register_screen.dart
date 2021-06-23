import 'package:eten/screens/log_in_screen.dart';
import 'package:eten/widgets/register_card.dart';
import 'package:flutter/material.dart';
import 'package:eten/widgets/blurred_image.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
    String username,
    String name,
    BuildContext ctx,
  ) async {
    UserCredential authResult;

    try {
      setState(
        () {
          _isLoading = true;
        },
      );
      authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authResult.user!.uid)
          .set(
        {
          'username': username,
          'name': name,
          'email': email,
        },
      );
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (err) {
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
          RegisterCard(
            navigatorHandler: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      LogInScreen(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
            submitFn: _submitAuthForm,
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }
}
