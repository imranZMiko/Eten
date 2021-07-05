import 'package:flutter/material.dart';

class RecipeCheck extends StatefulWidget {
  const RecipeCheck({Key? key}) : super(key: key);

  @override
  _RecipeCheckState createState() => _RecipeCheckState();
}

class _RecipeCheckState extends State<RecipeCheck> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: IconButton(
        icon: isClicked == true
            ? Icon(
                Icons.check_box,
                color: Colors.green,
                size: 16,
              )
            : Icon(
                Icons.check_box_outline_blank,
                size: 16,
              ),
        onPressed: () {
          setState(
            () {
              isClicked = !isClicked;
            },
          );
        },
        splashRadius: 16,
        constraints: BoxConstraints(),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
