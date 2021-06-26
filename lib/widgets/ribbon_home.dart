import 'package:flutter/material.dart';

class Ribbon extends StatefulWidget {
  const Ribbon({required this.title, Key? key}) : super(key: key);
  final String title;
  @override
  RibbonState createState() => RibbonState();
}

class RibbonState extends State<Ribbon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15.0),
          child: ClipPath(
            clipper: ArcClipper(),
            child: Container(
              width: 200.0,
              height: 36.0,
              padding: EdgeInsets.all(8.0),
              color: Color(0xffFFE5B4),
              child: Center(
                child: Container(
                  width: 170,
                  child: Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    var secondControlPoint = Offset(2.0, 7.5);
    var secondPoint = Offset(0.0, 15.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - 20, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
