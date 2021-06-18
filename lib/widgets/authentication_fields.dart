import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eten/providers/themeProvider.dart';

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
            color:
                Provider.of<ThemeInfo>(context).chosenTheme == ThemeMode.light
                    ? Colors.black
                    : Colors.white),
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
