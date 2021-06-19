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
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'Assets/AccountTheme/light1.jpg',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).backgroundColor,
                    child: IconButton(
                      icon: Icon(Icons.person),
                      iconSize: 110,
                      onPressed: null,
                    ),
                    radius: 100,
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
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'Username',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      AccountSettingsScreen(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
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
              title: 'About',
              icon: Icons.info_outline,
            ),
          ),
          GestureDetector(
            onTap: () {},
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
