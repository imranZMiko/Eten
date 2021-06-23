import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:eten/providers/themeProvider.dart';

class LogInCard extends StatefulWidget {
  const LogInCard(
      {this.navigatorHandler,
      required this.submitFn,
      required this.isLoading,
      Key? key})
      : super(key: key);
  final navigatorHandler;
  final bool isLoading;
  final void Function(
    String email,
    String password,
    BuildContext ctx,
  ) submitFn;
  @override
  _LogInCardState createState() => _LogInCardState();
}

class _LogInCardState extends State<LogInCard> {
  bool isObscured = true;
  var changeIcon = Icons.remove_red_eye_outlined;
  void initState() {
    isObscured = true;
    changeIcon = Icons.remove_red_eye_outlined;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shadowColor: Colors.transparent,
      color: Provider.of<ThemeInfo>(context).chosenTheme == ThemeMode.light
          ? Color.fromRGBO(255, 255, 255, 0.65)
          : Color.fromRGBO(0, 0, 0, 0.65),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        height: 370,
        constraints: BoxConstraints(minHeight: 370),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 50),
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
                            _userEmail = value!;
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
                            _userPassword = value!;
                          },
                          obscureText: isObscured,
                        ),
                      ),
                    ],
                  ),
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
                  'Don\'t have an account? Register',
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
    );
  }
}
