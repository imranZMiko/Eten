import 'package:eten/providers/userDataProvider.dart';
import 'package:eten/screens/about_screen.dart';
import 'package:eten/screens/account_settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'account_dashboard.dart';
import 'account_options.dart';
import 'delete_account_option.dart';

class AccountLoggedIn extends StatefulWidget {
  const AccountLoggedIn({Key? key}) : super(key: key);

  @override
  _AccountLoggedInState createState() => _AccountLoggedInState();
}

class _AccountLoggedInState extends State<AccountLoggedIn> {
  late Future _accountFuture;

  Future _obtainAccountFuture() {
    return Provider.of<UserData>(context, listen: false).getUserData();
  }

  @override
  void initState() {
    _accountFuture = _obtainAccountFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        else
          return Scaffold(
            body: ListView(
              children: [
                AccountDash(),
                Container(height: 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation1, animation2) =>
                              AccountSettingsScreen(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    });
                  },
                  child: AccountOptions(
                    title: 'Account Settings',
                    icon: Icons.settings,
                  ),
                ),
                DeleteOption(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            AboutScreen(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  },
                  child: AccountOptions(
                      title: 'About', icon: Icons.info_outline),
                ),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: AccountOptions(
                      title: 'Log out',
                      icon: Icons.logout,
                    ),
                  ),
                ),
              ],
            ),
          );
      },
      future: _accountFuture,
    );
  }
}
