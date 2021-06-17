import 'package:flutter/material.dart';
import 'package:eten/widgets/authentication_fields.dart';
import 'package:flutter/rendering.dart';

class AuthCard extends StatelessWidget {
  const AuthCard(
      {required this.topText,
      required this.formTextList,
      required this.buttonText,
      this.textButtonText,
      Key? key})
      : super(key: key);

  final String topText;
  final List<String> formTextList;
  final String buttonText;
  final textButtonText;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shadowColor: Colors.transparent,
      color: Color.fromRGBO(255, 255, 255, 0.5),
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
                    primary: Theme.of(context).backgroundColor),
                onPressed: () {},
                child: Text(buttonText),
              ),
              if (textButtonText != null)
                TextButton(
                  onPressed: () {},
                  child: Text(
                    textButtonText,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
