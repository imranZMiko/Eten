import 'package:eten/screens/log_in_screen.dart';
import 'package:eten/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:eten/widgets/blurred_image.dart';

class FavoritesLoggedOutScreen extends StatelessWidget {
  const FavoritesLoggedOutScreen({Key? key}) : super(key: key);

  static const String routeName = '/favorites/loggedout';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          BlurredImage(imageURL: 'Assets/Favorites.png'),
          Center(
            child: Card(
              shadowColor: Colors.transparent,
              color: Color.fromRGBO(255, 255, 255, 0.65),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 8.0,
              child: Container(
                height: deviceSize.height * 0.4,
                width: deviceSize.width * 0.7,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Please sign in or register to view favorites',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.black87,
                              padding: EdgeInsets.all(0),
                              visualDensity: VisualDensity.compact,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation1, animation2) => LogInScreen(),
                                  transitionDuration: Duration(seconds: 0),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in to an existing account',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.black87,
                              padding: EdgeInsets.all(0),
                              visualDensity: VisualDensity.compact,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation1, animation2) => RegisterScreen(),
                                  transitionDuration: Duration(seconds: 0),
                                ),
                              );
                            },
                            child: Text(
                              'Create new account',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
