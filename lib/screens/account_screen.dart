import 'package:eten/screens/accounts_logged_out_screen.dart';
import 'package:eten/widgets/account_logged_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  static const String routeName = '/account';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
          return AccountLoggedIn();
        }
        if (userSnapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();
        return AccountsLoggedOutScreen();
      },
    );
  }
}
