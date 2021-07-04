import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReAuthForm extends StatefulWidget {
  const ReAuthForm({required this.fn, Key? key}) : super(key: key);

  final VoidCallback fn;

  @override
  _ReAuthFormState createState() => _ReAuthFormState();
}

class _ReAuthFormState extends State<ReAuthForm> {
  bool isObscured = true;
  IconData changeIcon = Icons.remove_red_eye_outlined;
  String _email = '';
  String _password = '';

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    void _trySubmit(BuildContext ctx) async {
      final isValid = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();

      if (isValid) {
        _formKey.currentState!.save();
        AuthCredential credentials =
            EmailAuthProvider.credential(email: _email, password: _password);
        try {
          await FirebaseAuth.instance.currentUser!
              .reauthenticateWithCredential(credentials);

          widget.fn();
          Navigator.of(context).pop();
        } on FirebaseAuthException catch (err) {
          var message = 'An error occurred, please check your credentials!';

          if (err.message != null) {
            message = err.message!;
          }

          ScaffoldMessenger.of(ctx).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Theme.of(ctx).errorColor,
            ),
          );
          Navigator.of(context).pop();
        } catch (err) {
          print(err);
          Navigator.of(context).pop();
        }
      }
    }

    return AlertDialog(
      title: const Text('Authentication required'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 30),
                    child: Container(
                      height: 100,
                      child: Column(
                        children: [
                          Container(
                            width: deviceSize.width * 0.75,
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                labelStyle: TextStyle(fontSize: 14),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                  return 'Invalid email!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _email = value!;
                              },
                            ),
                          ),
                          Container(
                            width: deviceSize.width * 0.75,
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(fontSize: 14),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        isObscured = !isObscured;
                                        if (changeIcon == Icons.remove_red_eye)
                                          changeIcon =
                                              Icons.remove_red_eye_outlined;
                                        else
                                          changeIcon = Icons.remove_red_eye;
                                      },
                                    );
                                  },
                                  icon: Icon(changeIcon),
                                  iconSize: 16,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 5) {
                                  return 'Password is too short!';
                                }
                              },
                              onSaved: (value) {
                                _password = value!;
                              },
                              obscureText: isObscured,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5, top: 1),
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 16,
                  ),
                ),
                Expanded(
                  child: Text(
                    'If authentication fails, you will be signed out',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Send'),
          onPressed: () {
            _trySubmit(context);
          },
        ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
