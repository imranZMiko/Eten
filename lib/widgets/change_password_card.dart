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
          height: 370,
          constraints: BoxConstraints(minHeight: 370),
          width: deviceSize.width * 0.75,
          padding: EdgeInsets.all(16.0),
          child: Form(
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
                  padding: EdgeInsets.only(top: 40, bottom: 50),
                  child: Container(
                    height: 150,
                    child: Column(
                      children: [
                        Container(
                          width: deviceSize.width * 0.75,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Old Password',
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
                              labelText: 'New Password',
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
                              labelText: 'Confirm New Password',
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
    );
  }
}
