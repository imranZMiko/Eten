import 'package:eten/widgets/account_setting_general.dart';
import 'package:eten/widgets/account_setting_theme.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  AccountSettingsScreen({Key? key}) : super(key: key);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, left: 14, bottom: 15),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'General settings',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            GeneralSetting(),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 14, bottom: 10),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Theme settings',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            ThemeSetting(),
          ],
        ),
      ),
    );
  }
}
