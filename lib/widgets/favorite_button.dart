import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFavorited ? Icons.star:Icons.star_outline),
      onPressed: () {
        setState(() {
          isFavorited = !isFavorited;
        });
      },
      visualDensity: VisualDensity.compact,
      iconSize: 24,
      alignment: Alignment.center,
      color: Colors.yellow[700],
    );
  }
}
