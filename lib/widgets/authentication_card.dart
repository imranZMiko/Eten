import 'package:flutter/material.dart';
import 'package:eten/widgets/authentication_fields.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:eten/providers/themeProvider.dart';

class AuthCard extends StatelessWidget {
  const AuthCard(
      {required this.topText,
      required this.formTextList,
      required this.buttonText,
      this.textButtonText,
      this.navigatorHandler,
      Key? key})
      : super(key: key);

  final String topText;
  final List<String> formTextList;
  final String buttonText;
  final textButtonText;
  final navigatorHandler;

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
      elevation: 8.0,
      child: Container(
        height: topText == 'Register' ? 450 : 370,
        constraints:
            BoxConstraints(minHeight: topText == 'Register' ? 450 : 370),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                topText,
                style: TextStyle(
                  color: Provider.of<ThemeInfo>(context).chosenTheme ==
                          ThemeMode.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 50),
                child: Container(
                  height: 50.0 * formTextList.length,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Container(
                        width: deviceSize.width * 0.75,
                        height: 50,
                        child: Authfield(formText: formTextList[index]),
                      );
                    },
                    itemCount: formTextList.length,
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
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Provider.of<ThemeInfo>(context).chosenTheme ==
                            ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              if (textButtonText != null)
                TextButton(
                  onPressed: navigatorHandler,
                  child: Text(
                    textButtonText,
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
