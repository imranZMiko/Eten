import 'package:eten/providers/userDataProvider.dart';
import 'package:eten/screens/about_screen.dart';
import 'package:eten/screens/account_settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/account/account_dashboard.dart';
import '../widgets/account/account_options.dart';
import '../widgets/authentication/delete_account_option.dart';

class AccountLoggedInScreen extends StatefulWidget {
  const AccountLoggedInScreen({Key? key}) : super(key: key);

  @override
  _AccountLoggedInScreenState createState() => _AccountLoggedInScreenState();
}

class _AccountLoggedInScreenState extends State<AccountLoggedInScreen> {
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
            backgroundColor: Theme.of(context).backgroundColor,
            body: ListView(
              children: [
                AccountDash(),
                Container(height: 40),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
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
                  child:
                      AccountOptions(title: 'About', icon: Icons.info_outline),
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
