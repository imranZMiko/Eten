import 'package:eten/widgets/authentication_card.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({required this.imageData, Key? key})
      : super(key: key);

  static const String routeName = '/account/setting/password';
  final String imageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage(imageData),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: AuthCard(
              topText: 'Change Password',
              formTextList: [
                'Old Password',
                'New Password',
                'Confirm New Password'
              ],
              buttonText: 'Save Changes',
            ),
          ),
        ],
      ),
    );
  }
}
