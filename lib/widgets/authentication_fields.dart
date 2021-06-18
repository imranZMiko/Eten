import 'package:flutter/material.dart';

class Authfield extends StatefulWidget {
  const Authfield({required this.formText, Key? key}) : super(key: key);

  final String formText;

  @override
  _AuthfieldState createState() => _AuthfieldState();
}

class _AuthfieldState extends State<Authfield> {
  @override
  String formText = '';
  bool isObscured = true;
  var changeIcon = Icons.remove_red_eye_outlined;
  void initState() {
    formText = widget.formText;
    isObscured = formText == 'Password' ||
        formText == 'Confirm Password' ||
        formText == 'Old Password' ||
        formText == 'New Password' ||
        formText == 'Confirm New Password'
        ? true
        : false;
    changeIcon = Icons.remove_red_eye_outlined;
    super.initState();
  }

  Widget build(BuildContext context) {


    return TextFormField(
      decoration: InputDecoration(
          labelText: formText,
          labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
          suffixIcon: formText == 'Password' ||
                  formText == 'Confirm Password' ||
                  formText == 'Old Password' ||
                  formText == 'New Password' ||
                  formText == 'Confirm New Password'
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured;
                      if (changeIcon == Icons.remove_red_eye)
                        changeIcon = Icons.remove_red_eye_outlined;
                      else
                        changeIcon = Icons.remove_red_eye;
                    });
                  },
                  icon: Icon(changeIcon),
                  iconSize: 16,
                )
              : null),
      onSaved: (value) {},
      obscureText: isObscured,
    );
  }
}
