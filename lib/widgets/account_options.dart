import 'package:flutter/material.dart';

class AccountOptions extends StatelessWidget {
  const AccountOptions({required this.title, required this.icon, Key? key})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: 25,
        left: 15,
        right: 15,
      ),
      elevation: 5,
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
