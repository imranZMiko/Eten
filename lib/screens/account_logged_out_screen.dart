import 'package:eten/widgets/authentication/authcard_logged_out.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eten/providers/themeProvider.dart';

class AccountsLoggedOutScreen extends StatelessWidget {
  const AccountsLoggedOutScreen({Key? key}) : super(key: key);

  static const String routeName = '/accounts/loggedout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage(
                    Provider.of<ThemeInfo>(context, listen: false)
                                .chosenTheme ==
                            ThemeMode.light
                        ? 'Assets/AccountTheme/light1.jpg'
                        : 'Assets/AccountTheme/dark1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 20,
            child: Container(
              height: 45,
              width: 45,
              child: Image.asset('Assets/LogoWithoutEdge.png'),
            ),
          ),
          LoggedOutCard(
            title: 'Please sign in or register',
          ),
        ],
      ),
    );
  }
}
