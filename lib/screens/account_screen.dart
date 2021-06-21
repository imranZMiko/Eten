import 'package:eten/screens/about_screen.dart';
import 'package:eten/screens/account_settings_screen.dart';
import 'package:eten/widgets/account_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eten/providers/themeProvider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  static const String routeName = '/account';

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String imageData='';
  @override
  void initState() {
    if(Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
        ThemeMode.light) imageData = 'Assets/AccountTheme/light1.jpg';
    else imageData = 'Assets/AccountTheme/dark1.jpg';
    super.initState();
  }
  void changeTheme(String newTheme){
    setState(() {
      imageData = newTheme;
    });
  }

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
                  imageData,
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
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Container()),
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
                            color: Provider.of<ThemeInfo>(context).chosenTheme ==
                                ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            height: 50,
                            width: 2,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
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
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        AccountSettingsScreen(changeHandler: changeTheme, currentTheme: imageData,),
                    transitionDuration: Duration(seconds: 0),
                  ),
                );
              });
            },
            child: AccountOptions(
              title: 'Account Settings',
              icon: Icons.settings,
              tileImage: imageData,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: AccountOptions(
              title: 'Delete Account',
              icon: Icons.delete_outline_sharp,
              tileImage: imageData,
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
              tileImage: imageData,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: AccountOptions(
                title: 'Log out',
                icon: Icons.logout,
                tileImage: imageData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
