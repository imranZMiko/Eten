import 'package:flutter/material.dart';
import './screens/homepage_screen.dart';
import './helpers/color_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF9FC5F8,
            ColorGenerator.getSwatch(Color(0xFF9FC5F8))
        ),
      ),
      routes: {
        HomePageScreen.routeName: (ctx) => HomePageScreen(),
      },
    );
  }
}