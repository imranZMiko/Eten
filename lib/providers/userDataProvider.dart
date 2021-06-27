import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserData with ChangeNotifier {
  String name = '';
  String username = '';
  String lightTheme = '';
  String darkTheme = '';

  Future<void> getUserData() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    try {
      var result = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser!.uid)
          .get();

      if (result.exists) {
        name = result.data()!['name'];
        username = result.data()!['username'];
        lightTheme = result.data()!['lightTheme'];
        darkTheme = result.data()!['darkTheme'];
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> changeTheme(String newTheme, ThemeMode current) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var result = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .get();
    String light = result.data()!['lightTheme'];
    String dark = result.data()!['darkTheme'];
    if (current == ThemeMode.light)
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

    lightTheme = light;
    darkTheme = dark;

    notifyListeners();
  }

  void updateInfo(BuildContext ctx, String title, String inputData, ThemeMode current) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .update(
      {title.toLowerCase(): inputData},
    ).then((_) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text('$title successfully updated.'),
          backgroundColor:
          current ==
              ThemeMode.light
              ? Colors.teal[100]
              : Colors.teal[800],
        ),
      );
    }).catchError(
          (error) {
        print(error);
      },
    );

    if(title == 'Username')
      username = inputData;
    else if(title == 'Name')
      name = inputData;

    notifyListeners();
  }
}
