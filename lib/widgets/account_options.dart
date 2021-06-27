import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class AccountOptions extends StatelessWidget {
  const AccountOptions(
      {required this.title,
      required this.icon,
      Key? key})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: 25,
        left: 8,
        right: 8,
      ),
      elevation: 2,
      child: ListTile(
        tileColor: Theme.of(context).backgroundColor,
        leading: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        trailing: Icon(icon),
      ),
    );
  }
}
