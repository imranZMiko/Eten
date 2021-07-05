import 'package:eten/providers/themeProvider.dart';
import 'package:eten/providers/userDataProvider.dart';
import 'package:eten/screens/auth_change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'account_settings_general_data.dart';

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Container(
        height: 270,
        child: Column(
          children: [
            GeneralSettingsData(
              title: 'Username',
              data: Provider.of<UserData>(context, listen: false).username,
            ),
            GeneralSettingsData(
              title: 'Name',
              data: Provider.of<UserData>(context, listen: false).name,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          ChangePasswordScreen(),
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
                      color: Provider.of<ThemeInfo>(context).chosenTheme ==
                              ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
