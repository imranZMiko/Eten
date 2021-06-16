import 'package:eten/widgets/account_options.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

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
                    child: IconButton(
                      icon: Icon(Icons.person),
                      iconSize: 90,
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
          AccountOptions(
            title: 'Account Settings',
            icon: Icons.settings,
          ),
          AccountOptions(
            title: 'Delete Account',
            icon: Icons.delete_outline_sharp,
          ),
          AccountOptions(
            title: 'About',
            icon: Icons.info_outline,
          ),
          Expanded(
            child: Container(),
          ),
          AccountOptions(
            title: 'Log out',
            icon: Icons.logout,
          ),
          Container(
            height: 20,
          ),
        ],
      ),
    );
  }
}
