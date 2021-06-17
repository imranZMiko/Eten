import 'package:flutter/material.dart';

class Authfield extends StatelessWidget {
  const Authfield({required this.formText, Key? key}) : super(key: key);
  final Map<String, String> formText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: formText as String),
      onSaved: (value) {},
      obscureText: formText as String == 'Password' ||
              formText as String == 'Confirm Password'
          ? true
          : false,
    );
  }
}
