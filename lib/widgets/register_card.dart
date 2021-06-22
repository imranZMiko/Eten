import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:eten/providers/themeProvider.dart';

class RegisterCard extends StatefulWidget {
  const RegisterCard({this.navigatorHandler, Key? key}) : super(key: key);
  final navigatorHandler;
  @override
  _RegisterCardState createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  bool isObscured = true;
  var changeIcon = Icons.remove_red_eye_outlined;
  void initState() {
    isObscured = true;
    changeIcon = Icons.remove_red_eye_outlined;
    super.initState();
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
        height: 500,
        constraints: BoxConstraints(minHeight: 500),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 50),
                child: Container(
                  height: 250,
                  child: Column(
                    children: [
                      Container(
                        width: deviceSize.width * 0.75,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      Container(
                        width: deviceSize.width * 0.75,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
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
                            if (value!.isEmpty ||
                                !value.contains('@')) {
                              return 'Invalid email!';
                            }
                            return null;
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
                          onSaved: (value) {},
                          obscureText: isObscured,
                        ),
                      ),
                      Container(
                        width: deviceSize.width * 0.75,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
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
                          onSaved: (value) {},
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
                onPressed: () {},
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
    );
  }
}
