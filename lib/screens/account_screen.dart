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
          Card(
            margin: EdgeInsets.all(0),
            elevation: 5,
            child: Stack(
              children: [
                Image.asset(
                  'Assets/AccountTheme/light9.jpg',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).backgroundColor,
                      child: IconButton(
                        icon: Icon(Icons.person),
                        iconSize: 90,
                        onPressed: null,
                      ),
                      radius: 80,
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  right: MediaQuery.of(context).size.width / 2 - 85,
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    splashRadius: 20,
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 60,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            'OOgaBBOga',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          color: Colors.black45,
                          height: 50,
                          width: 2,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            'OOgaBBOga',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
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
  }
}
