import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eten/providers/themeProvider.dart';
import 'package:eten/widgets/reauthenticate_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'account_options.dart';

class DeleteOption extends StatelessWidget {
  DeleteOption({Key? key}) : super(key: key);

  void deleteAccount(BuildContext context) async {
    bool isConfirmed = false;
    bool isAuth = false;

    User? user = FirebaseAuth.instance.currentUser;
    try {
      isConfirmed = false;
      await showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
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

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Account successfully deleted.'),
            backgroundColor:
                Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
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
              return ReAuthForm(fn: () {isAuth = true;});
            });
        if (isAuth) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .delete();

          await user.delete();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Account successfully deleted.'),
              backgroundColor:
                  Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
                          ThemeMode.light
                      ? Colors.teal[100]
                      : Colors.teal[800],
            ),
          );
        }
      } else {
        var message = 'An error occurred, please check your credentials!';

        if (err.message != null) {
          message = err.message!;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }
    } catch (err) {
      print(err);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.toString()),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => deleteAccount(context),
      child: AccountOptions(
        title: 'Delete Account',
        icon: Icons.delete_outline_sharp,
      ),
    );
  }
}
