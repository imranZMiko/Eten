import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eten/screens/about_screen.dart';
import 'package:eten/screens/account_settings_screen.dart';
import 'package:eten/screens/accounts_logged_out_screen.dart';
import 'package:eten/widgets/account_options.dart';
import 'package:eten/widgets/profile_image.dart';
import 'package:eten/widgets/reauthenticate_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  bool isConfirmed = false;
  bool isAuth = false;

  void toggleAuth() {
    isAuth = true;
  }

  void refresh() {
    setState(() {});
  }

  void changeTheme(String newTheme) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var result = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .get();
    String light = result.data()!['lightTheme'];
    String dark = result.data()!['darkTheme'];
    if (Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
        ThemeMode.light)
      light = newTheme;
    else
      dark = newTheme;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .update({'lightTheme': light});
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .update({'darkTheme': dark});
    setState(() {});
  }

  Future<Map<String, String>> getUserData() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    Map<String, String> temp = {};
    try {
      var result = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser!.uid)
          .get();

      if (result.exists) {
        temp = {
          'name': result.data()!['name'],
          'username': result.data()!['username'],
          'lightTheme': result.data()!['lightTheme'],
          'darkTheme': result.data()!['darkTheme'],
        };
      }
    } catch (err) {
      print(err);
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
          return FutureBuilder(
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              else
                return Scaffold(
                  body: ListView(
                    children: [
                      Card(
                        margin: EdgeInsets.all(0),
                        elevation: 5,
                        child: Stack(
                          children: [
                            Image.asset(
                              (snapshot.data! as Map<String, String>)[
                                  Provider.of<ThemeInfo>(context).chosenTheme ==
                                          ThemeMode.light
                                      ? 'lightTheme'
                                      : 'darkTheme']!,
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            ProfileImage(
                              currentUser: userSnapshot.data as User,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Username',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                        Text(
                                          (snapshot.data! as Map<String,
                                              String>)['username']!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Container(
                                        color: Provider.of<ThemeInfo>(context)
                                                    .chosenTheme ==
                                                ThemeMode.light
                                            ? Colors.black
                                            : Colors.white,
                                        height: 50,
                                        width: 2,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                        Text(
                                          (snapshot.data!
                                              as Map<String, String>)['name']!,
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
                      Container(height: 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        AccountSettingsScreen(
                                  refreshFn: refresh,
                                  changeHandler: changeTheme,
                                  currentTheme:
                                      (snapshot.data! as Map<String, String>)[
                                          Provider.of<ThemeInfo>(context)
                                                      .chosenTheme ==
                                                  ThemeMode.light
                                              ? 'lightTheme'
                                              : 'darkTheme']!,
                                  username: (snapshot.data!
                                      as Map<String, String>)['username']!,
                                  name: (snapshot.data!
                                      as Map<String, String>)['name']!,
                                ),
                                transitionDuration: Duration(seconds: 0),
                              ),
                            );
                          });
                        },
                        child: AccountOptions(
                          title: 'Account Settings',
                          icon: Icons.settings,
                          tileImage: (snapshot.data! as Map<String, String>)[
                              Provider.of<ThemeInfo>(context).chosenTheme ==
                                      ThemeMode.light
                                  ? 'lightTheme'
                                  : 'darkTheme']!,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          User? user = FirebaseAuth.instance.currentUser;
                          try {
                            isConfirmed = false;
                            await showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Are you sure?'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Yes'),
                                      onPressed: () {
                                        isConfirmed = true;
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('No'),
                                      onPressed: () {
                                        isConfirmed = false;
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );

                            if (isConfirmed) {
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(user!.uid)
                                  .delete();

                              await user.delete();

                              ScaffoldMessenger.of(ctx).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Account successfully deleted.'),
                                  backgroundColor: Provider.of<ThemeInfo>(
                                                  context,
                                                  listen: false)
                                              .chosenTheme ==
                                          ThemeMode.light
                                      ? Colors.teal[100]
                                      : Colors.teal[900],
                                ),
                              );
                            }
                          } on FirebaseAuthException catch (err) {
                            print(err.code);
                            if (err.code == 'requires-recent-login') {
                              await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ReAuthForm(fn: toggleAuth);
                                  });
                              if (isAuth) {
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(user!.uid)
                                    .delete();

                                await user.delete();

                                ScaffoldMessenger.of(ctx).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Account successfully deleted.'),
                                    backgroundColor: Provider.of<ThemeInfo>(
                                                    context,
                                                    listen: false)
                                                .chosenTheme ==
                                            ThemeMode.light
                                        ? Colors.teal[100]
                                        : Colors.teal[800],
                                  ),
                                );
                              }
                            } else {
                              var message =
                                  'An error occurred, please check your credentials!';

                              if (err.message != null) {
                                message = err.message!;
                              }

                              ScaffoldMessenger.of(ctx).showSnackBar(
                                SnackBar(
                                  content: Text(message),
                                  backgroundColor: Theme.of(ctx).errorColor,
                                ),
                              );
                            }
                          } catch (err) {
                            print(err);
                            ScaffoldMessenger.of(ctx).showSnackBar(
                              SnackBar(
                                content: Text(err.toString()),
                                backgroundColor: Theme.of(ctx).errorColor,
                              ),
                            );
                          }
                        },
                        child: AccountOptions(
                          title: 'Delete Account',
                          icon: Icons.delete_outline_sharp,
                          tileImage: (snapshot.data! as Map<String, String>)[
                              Provider.of<ThemeInfo>(context).chosenTheme ==
                                      ThemeMode.light
                                  ? 'lightTheme'
                                  : 'darkTheme']!,
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
                          tileImage: (snapshot.data! as Map<String, String>)[
                              Provider.of<ThemeInfo>(context).chosenTheme ==
                                      ThemeMode.light
                                  ? 'lightTheme'
                                  : 'darkTheme']!,
                        ),
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
                            tileImage: (snapshot.data! as Map<String, String>)[
                                Provider.of<ThemeInfo>(context).chosenTheme ==
                                        ThemeMode.light
                                    ? 'lightTheme'
                                    : 'darkTheme']!,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
            },
            future: getUserData(),
          );
        }
        if (userSnapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();
        return AccountsLoggedOutScreen();
      },
    );
  }
}
