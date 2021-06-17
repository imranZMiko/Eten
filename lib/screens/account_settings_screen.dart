import 'package:eten/widgets/account_data.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          AccountData(
            title: 'Username',
          ),
          AccountData(
            title: 'E-mail',
          ),
          Padding(
            padding: EdgeInsets.only(left: 10,top:30),
            child: TextButton(
              onPressed: () {},
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Change password?',
                  style: TextStyle(color: Colors.black, fontSize: 16, decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
