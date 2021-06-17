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
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 8.0,
      child: Container(
        height: 370,
        constraints: BoxConstraints(minHeight: 370),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                topText,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                height: 230,
                child: ListView.builder(
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
              /* */
              ElevatedButton(
                 style: ElevatedButton.styleFrom(primary: Theme.of(context).backgroundColor),
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
