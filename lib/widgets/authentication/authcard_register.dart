import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:eten/providers/themeProvider.dart';

class RegisterCard extends StatefulWidget {
  RegisterCard(
      {required this.navigatorHandler,
      required this.submitFn,
      required this.isLoading,
      Key? key})
      : super(key: key);
  final navigatorHandler;
  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    String name,
    BuildContext ctx,
  ) submitFn;
  @override
  _RegisterCardState createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  bool isObscured1 = true;
  bool isObscured2 = true;
  var changeIcon = Icons.visibility_off_outlined;
  TextEditingController controller = TextEditingController();

  void initState() {
    isObscured1 = true;
    isObscured2 = true;
    changeIcon = Icons.visibility_off_outlined;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userName = '';
  var _name = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
          _name.trim(), context);
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
          height: 500,
          constraints: BoxConstraints(minHeight: 500),
          width: deviceSize.width * 0.75,
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      children: [
                        Container(
                          width: deviceSize.width * 0.75,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                              errorStyle: TextStyle(fontSize: 10),
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 4) {
                                return 'Please enter at least 4 characters';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _userName = value!;
                            },
                          ),
                        ),
                        Container(
                          width: deviceSize.width * 0.75,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                              errorStyle: TextStyle(fontSize: 10),
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 4) {
                                return 'Please enter at least 4 characters';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _name = value!;
                            },
                          ),
                        ),
                        Container(
                          width: deviceSize.width * 0.75,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                              errorStyle: TextStyle(fontSize: 10),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _userEmail = value!;
                            },
                          ),
                        ),
                        Container(
                          width: deviceSize.width * 0.75,
                          child: TextFormField(
                            controller: controller,
                            decoration: InputDecoration(
                              labelText: 'Password',
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
                                      if (changeIcon == Icons.visibility_outlined)
                                        changeIcon =
                                            Icons.visibility_off_outlined;
                                      else
                                        changeIcon = Icons.visibility_outlined;
                                    },
                                  );
                                },
                                icon: Icon(changeIcon),
                                iconSize: 16,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 5) {
                                return 'Password is too short!';
                              }
                            },
                            onSaved: (value) {
                              _userPassword = value!;
                            },
                            obscureText: isObscured1,
                          ),
                        ),
                        Container(
                          width: deviceSize.width * 0.75,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
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
                                icon: Icon(isObscured2? Icons.visibility_off_outlined : Icons.visibility_outlined),
                                iconSize: 16,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
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
                            obscureText: isObscured2,
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
                    onPressed: _trySubmit,
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Provider.of<ThemeInfo>(context).chosenTheme ==
                                ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: widget.navigatorHandler,
                    child: Text(
                      'Already have an account? Sign in.',
                      style: TextStyle(
                        color: Provider.of<ThemeInfo>(context).chosenTheme ==
                                ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
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
