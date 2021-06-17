import 'package:eten/screens/about_screen.dart';
import 'package:eten/screens/account_settings_screen.dart';
import 'package:eten/widgets/account_options.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  static const String routeName = '/account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).backgroundColor,
                    child: IconButton(
                      icon: Icon(Icons.person),
                      iconSize: 120,
                      onPressed: null,
                    ),
                    radius: 110,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 80,
                child: IconButton(
                  icon: Icon(Icons.edit),
                  splashRadius: 20,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AccountSettingsScreen.routeName);
            },
            child: AccountOptions(
              title: 'Account Settings',
              icon: Icons.settings,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: AccountOptions(
              title: 'Delete Account',
              icon: Icons.delete_outline_sharp,
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AboutScreen.routeName);
            },
            child: AccountOptions(
              title: 'About',
              icon: Icons.info_outline,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          GestureDetector(
            onTap: (){},
            child: AccountOptions(
              title: 'Log out',
              icon: Icons.logout,
            ),
          ),
          Container(
            height: 20,
          ),
        ],
      ),
    );
  }
}
