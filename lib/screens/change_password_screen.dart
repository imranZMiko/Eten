import 'package:eten/providers/themeProvider.dart';
import 'package:eten/providers/userDataProvider.dart';
import 'package:eten/widgets/change_password_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  static const String routeName = '/account/setting/password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage(Provider.of<ThemeInfo>(context,
                                listen: false)
                            .chosenTheme ==
                        ThemeMode.light
                    ? Provider.of<UserData>(context, listen: false).lightTheme
                    : Provider.of<UserData>(context, listen: false).darkTheme),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ChangePasswordCard(),
        ],
      ),
    );
  }
}
