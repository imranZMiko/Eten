import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as Math;

class AccountOptions extends StatelessWidget {
  const AccountOptions(
      {required this.title,
      required this.icon,
      required this.tileImage,
      Key? key})
      : super(key: key);

  final String title;
  final IconData icon;
  final String tileImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: 25,
        left: 8,
        right: 8,
      ),
      elevation: 3,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 0, right: 0),
        tileColor: Theme.of(context).backgroundColor,
        leading: Container(
          width: 163,
          height: 64,
          child: Row(
            children: [
              Container(
                width: 10,
                height: 64,
                child:
                Transform(
                  transform: Matrix4.rotationY(
                      -2 * Math.pi / 2
                  ),
                  alignment: Alignment.center,
                  child:
                Image.asset(
                  tileImage,
                  fit: BoxFit.none,

                ),
                ),
              ),
              Container(
                width: 16,
                height: 64,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        trailing: Container(
          width: 50,
          height: 64,
          child: Row(
            children: [
              Icon(icon),
              Container(
                width: 16,
                height: 64,
              ),
              Container(
                width: 10,
                height: 64,
                child: Image.asset(
                  tileImage,
                  fit: BoxFit.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
