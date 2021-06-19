import 'package:eten/screens/change_password_screen.dart';
import 'package:eten/widgets/account_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eten/providers/themeProvider.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({required this.changeHandler, Key? key})
      : super(key: key);
  final Function changeHandler;
  static const String routeName = '/account/settings';
  static const List<String> imageURL = [
    'Assets/AccountTheme/light1.jpg',
    'Assets/AccountTheme/light2.jpg',
    'Assets/AccountTheme/light3.jpg',
    'Assets/AccountTheme/light4.jpg',
    'Assets/AccountTheme/light5.jpg',
    'Assets/AccountTheme/light6.jpg',
    'Assets/AccountTheme/light7.jpg',
    'Assets/AccountTheme/light8.jpg',
    'Assets/AccountTheme/light9.jpg',
    'Assets/AccountTheme/light10.jpg',
    'Assets/AccountTheme/light11.jpg',
  ];
  static const List<String> imageURLDark = [
    'Assets/AccountTheme/dark1.png',
    'Assets/AccountTheme/dark2.png',
    'Assets/AccountTheme/dark3.png',
    'Assets/AccountTheme/dark4.jpg',
    'Assets/AccountTheme/dark5.png',
    'Assets/AccountTheme/dark6.jpg',
    'Assets/AccountTheme/dark7.jpg',
    'Assets/AccountTheme/dark8.jpg',
    'Assets/AccountTheme/dark9.jpg',
    'Assets/AccountTheme/dark10.jpg',
    'Assets/AccountTheme/dark11.png',
  ];

  static const List<String> imageText = [
    'Light theme 1',
    'Light theme 2',
    'Light theme 3',
    'Light theme 4',
    'Light theme 5',
    'Light theme 6',
    'Light theme 7',
    'Light theme 8',
    'Light theme 9',
    'Light theme 10',
    'Light theme 11',
  ];
  static const List<String> imageTextDark = [
    'Dark theme 1',
    'Dark theme 2',
    'Dark theme 3',
    'Dark theme 4',
    'Dark theme 5',
    'Dark theme 6',
    'Dark theme 7',
    'Dark theme 8',
    'Dark theme 9',
    'Dark theme 10',
    'Dark theme 11',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Account Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, left: 14, bottom: 15),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'General settings',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Container(
                height: 330,
                child: Column(
                  children: [
                    AccountData(
                      title: 'Username',
                    ),
                    AccountData(
                      title: 'Name',
                    ),
                    AccountData(
                      title: 'E-mail',
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 30),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  ChangePasswordScreen(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Change password?',
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  Provider.of<ThemeInfo>(context).chosenTheme ==
                                          ThemeMode.light
                                      ? Colors.black
                                      : Colors.white,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 14, bottom: 10),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Theme settings',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            if (Provider.of<ThemeInfo>(context, listen: false)
                                    .chosenTheme ==
                                ThemeMode.light)
                              changeHandler(imageURL[index]);
                            else
                              changeHandler(imageURLDark[index]);
                          },
                          child: Card(
                            elevation: 5.0,
                            child: Container(
                              height: 333,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 20, bottom: 20, left: 15),
                                      child: Text(
                                        Provider.of<ThemeInfo>(context,
                                                        listen: false)
                                                    .chosenTheme ==
                                                ThemeMode.light
                                            ? imageText[index]
                                            : imageTextDark[index],
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    Provider.of<ThemeInfo>(context,
                                                    listen: false)
                                                .chosenTheme ==
                                            ThemeMode.light
                                        ? imageURL[index]
                                        : imageURLDark[index],
                                    height: 270,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    itemCount: imageURL.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
