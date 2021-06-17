import 'package:flutter/material.dart';
import 'dart:ui';

class BlurredImage extends StatelessWidget {
  const BlurredImage({required this.imageURL, Key? key}) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new ExactAssetImage(imageURL),
          fit: BoxFit.cover,
        ),
      ),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
        ),
      ),
    );
  }
}
