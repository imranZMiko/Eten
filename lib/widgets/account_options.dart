import 'package:flutter/material.dart';

class AccountOptions extends StatelessWidget {
  const AccountOptions({required this.title, required this.icon, Key? key})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: ListTile(
        tileColor: Theme.of(context).backgroundColor,
        leading: Text(
          title,
          style: TextStyle(fontSize: 22),
        ),
        trailing: Icon(icon),
      ),
    );
  }
}
