import 'package:eten/providers/themeProvider.dart';
import 'package:eten/screens/auth_log_in_screen.dart';
import 'package:eten/screens/auth_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class LoggedOutCard extends StatelessWidget {
  const LoggedOutCard({required this.title, Key? key}) : super(key: key);

   final String title;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Center(
      child: Card(
        shadowColor: Colors.transparent,
        color:
        Provider.of<ThemeInfo>(context).chosenTheme == ThemeMode.light
            ? Color.fromRGBO(255, 255, 255, 0.65)
            : Color.fromRGBO(0, 0, 0, 0.65),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 8.0,
        child: Container(
          height: 300,
          width: deviceSize.width * 0.7,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Provider.of<ThemeInfo>(context).chosenTheme ==
                      ThemeMode.light
                      ? Colors.black
                      : Colors.white,
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
                        primary:
                        Provider.of<ThemeInfo>(context).chosenTheme ==
                            ThemeMode.light
                            ? Colors.black87
                            : Colors.white,
                        padding: EdgeInsets.all(0),
                        visualDensity: VisualDensity.compact,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation1, animation2) =>
                                LogInScreen(),
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
                        primary:
                        Provider.of<ThemeInfo>(context).chosenTheme ==
                            ThemeMode.light
                            ? Colors.black87
                            : Colors.white,
                        padding: EdgeInsets.all(0),
                        visualDensity: VisualDensity.compact,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation1, animation2) =>
                                RegisterScreen(),
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
    );
  }
}
