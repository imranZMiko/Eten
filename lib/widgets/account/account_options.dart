import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class AccountOptions extends StatelessWidget {
  const AccountOptions(
      {required this.title,
      required this.icon,
      Key? key})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 6, horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Icon(icon, size: 18,),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).textTheme.bodyText1!.color,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
