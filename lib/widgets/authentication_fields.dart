import 'package:flutter/material.dart';

class Authfield extends StatelessWidget {
  const Authfield({required this.formText, Key? key}) : super(key: key);
  final String formText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: formText,
        labelStyle: TextStyle(
          fontSize: 14,
        ),
      ),
      onSaved: (value) {},
      obscureText: formText == 'Password' ||
              formText == 'Confirm Password' ||
              formText == 'Old Password' ||
              formText == 'New Password' ||
              formText == 'Confirm New Password'
          ? true
          : false,
    );
  }
}
