import 'package:eten/widgets/authentication_card.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  static const String routeName = '/account/setting/password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: AuthCard(
        topText: 'Change Password',
        formTextList: ['Old Password', 'New Password', 'Confirm New Password'],
        buttonText: 'Save Changes',
      ),),
    );
  }
}
