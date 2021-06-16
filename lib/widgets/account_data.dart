import 'package:flutter/material.dart';

class AccountData extends StatelessWidget {
  const AccountData({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Theme.of(context).backgroundColor,
          contentPadding: EdgeInsets.only(top: 15),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
            splashRadius: 18,
          ),
          border: UnderlineInputBorder(),
          hintText: title,
        ),
      ),
    );
  }
}
