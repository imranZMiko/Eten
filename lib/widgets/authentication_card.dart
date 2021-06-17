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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        height: 260,
        constraints: BoxConstraints(minHeight: 260),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Text(
                topText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              /* ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Authfield(formText: formTextList[index]);
                },
                itemCount: formTextList.length,
              ),*/
              ElevatedButton(
               /* style: ButtonStyle(
                    backgroundColor: ),*/
                onPressed: () {},
                child: Text(buttonText),
              ),
              if (textButtonText != null)
                TextButton(
                  onPressed: () {},
                  child: Text(textButtonText),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
