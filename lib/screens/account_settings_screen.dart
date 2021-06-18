import 'package:eten/screens/change_password_screen.dart';
import 'package:eten/widgets/account_data.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  static const String routeName = '/account/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Account Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 40,
          ),
          AccountData(
            title: 'Username',
          ),
          AccountData(
            title: 'E-mail',
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 30),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => ChangePasswordScreen(),
                    transitionDuration: Duration(seconds: 0),
                  ),
                );
              },
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Change password?',
                  style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
