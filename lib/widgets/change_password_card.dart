import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:eten/providers/themeProvider.dart';

class ChangePasswordCard extends StatefulWidget {
  const ChangePasswordCard({this.navigatorHandler, Key? key}) : super(key: key);
  final navigatorHandler;
  @override
  _ChangePasswordCardState createState() => _ChangePasswordCardState();
}

class _ChangePasswordCardState extends State<ChangePasswordCard> {
  var _formKey = GlobalKey<FormState>();
  String oldPassword = '';
  String newPassword = '';
  bool isObscured1 = true;
  bool isObscured2 = true;
  bool isObscured3 = true;
  var changeIcon = Icons.remove_red_eye_outlined;
  TextEditingController controller = TextEditingController();
  void initState() {
    isObscured1 = true;
    isObscured2 = true;
    isObscured3 = true;
    changeIcon = Icons.remove_red_eye_outlined;
    super.initState();
  }

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Center(
      child: Card(
        shadowColor: Colors.transparent,
        color: Provider.of<ThemeInfo>(context).chosenTheme == ThemeMode.light
            ? Color.fromRGBO(255, 255, 255, 0.65)
            : Color.fromRGBO(0, 0, 0, 0.65),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          height: 430,
          constraints: BoxConstraints(minHeight: 400),
          width: deviceSize.width * 0.75,
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 30),
                    child: Column(
                      children: [
                        Container(
                          width: deviceSize.width * 0.75,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Old Password',
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                              errorStyle: TextStyle(fontSize: 10),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      isObscured1 = !isObscured1;
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
                              oldPassword = value!;
                            },
                            obscureText: isObscured1,
                          ),
                        ),
                        Container(
                          width: deviceSize.width * 0.75,
                          child: TextFormField(
                            controller: controller,
                            decoration: InputDecoration(
                              labelText: 'New Password',
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                              errorStyle: TextStyle(fontSize: 10),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      isObscured2 = !isObscured2;
                                    },
                                  );
                                },
                                icon: Icon(isObscured2?Icons.remove_red_eye_outlined:Icons.remove_red_eye),
                                iconSize: 16,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 5) {
                                return 'Password is too short!';
                              }
                            },
                            onSaved: (value) {
                              newPassword = value!;
                            },
                            obscureText: isObscured2,
                          ),
                        ),
                        Container(
                          width: deviceSize.width * 0.75,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Confirm New Password',
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                              errorStyle: TextStyle(fontSize: 10),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      isObscured3 = !isObscured3;
                                    },
                                  );
                                },
                                icon: Icon(isObscured3? Icons.remove_red_eye_outlined : Icons.remove_red_eye),
                                iconSize: 16,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 5) {
                                return 'Password is too short!';
                              }
                              if (value != controller.text)
                                return 'Passwords do not match!';
                            },
                            onSaved: (value) {},
                            obscureText: isObscured3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Row(
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
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Provider.of<ThemeInfo>(context).chosenTheme ==
                              ThemeMode.light
                          ? Color(0xFFe4e5f6)
                          : Color(0xFF3c3c4a),
                    ),
                    onPressed: () async {
                      _trySubmit();
                      User? user = FirebaseAuth.instance.currentUser;
                      try {
                        AuthCredential credentials =
                            EmailAuthProvider.credential(
                                email: user!.email!, password: oldPassword);

                        await FirebaseAuth.instance.currentUser!
                            .reauthenticateWithCredential(credentials);
                        await user.updatePassword(newPassword);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Password updated successfully.'),
                            backgroundColor:
                                Provider.of<ThemeInfo>(context, listen: false)
                                            .chosenTheme ==
                                        ThemeMode.light
                                    ? Colors.teal[100]
                                    : Colors.teal[800],
                          ),
                        );
                      } on FirebaseAuthException catch (err) {
                        print(err.code);

                        var message =
                            'An error occurred, please check your credentials!';

                        if (err.message != null) {
                          message = err.message!;
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                            backgroundColor: Theme.of(context).errorColor,
                          ),
                        );
                      } catch (err) {
                        print(err);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(err.toString()),
                            backgroundColor: Theme.of(context).errorColor,
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Save changes',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Provider.of<ThemeInfo>(context).chosenTheme ==
                                ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
