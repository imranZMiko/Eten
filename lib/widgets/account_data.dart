import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:eten/providers/themeProvider.dart';

class AccountData extends StatefulWidget {
  AccountData({required this.title, required this.data, Key? key})
      : super(key: key);
  String title;
  String data;
  @override
  _AccountDataState createState() => _AccountDataState();
}

class _AccountDataState extends State<AccountData> {
  bool isEnabled = false;
  IconData icon = Icons.edit;
  TextEditingController fieldData = TextEditingController();
  void getUserData(BuildContext ctx) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .update(
      {widget.title.toLowerCase(): fieldData.text},
    ).then((_) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text('${widget.title} successfully updated.'),
          backgroundColor:
              Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
                      ThemeMode.light
                  ? Colors.teal[100]
                  : Colors.teal[900],
        ),
      );
    }).catchError(
      (error) {
        print(error);
      },
    );
  }
  @override
  void initState() {
    fieldData.text = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 25),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: fieldData,
              enabled: isEnabled,
             // initialValue: widget.data,
              decoration: InputDecoration(
                labelStyle: TextStyle(height: 0.5),
                labelText: widget.title,
                fillColor: Theme.of(context).backgroundColor,
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            color: icon == Icons.check ? Colors.green : null,
            onPressed: () {
              setState(
                () {
                  isEnabled = !isEnabled;
                  if (icon == Icons.edit)
                    icon = Icons.check;
                  else {
                    icon = Icons.edit;
                    getUserData(context);
                  }
                },
              );
            },
            icon: Icon(icon),
            iconSize: 18,
            splashRadius: 18,
          ),
        ],
      ),
    );
  }
}
