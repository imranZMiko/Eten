import 'dart:math';

import 'package:eten/widgets/dark_mode_switch.dart';
import 'package:eten/widgets/homepage_image.dart';
import 'package:eten/widgets/popular_list.dart';
import 'package:eten/widgets/random_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';
  final int index = Random().nextInt(6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                HomeImage(index: index),
                Positioned(
                  top: 20,
                  left: 10,
                  width: MediaQuery.of(context).size.width - 10,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10, left: 5, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset('Assets/LogoWithoutEdge.png'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 17, left: 8),
                              child: Text(
                                'Eten',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: DarkModeSwitch(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            PopularList(
              title: 'Popular',
              icon: Icons.stars,
            ),
            RandomList(
              title: 'Random',
              icon: Icons.shuffle,
            ),
          ],
        ),
      ),
    );
  }
}
