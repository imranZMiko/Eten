import 'package:eten/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
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
        primarySwatch: MaterialColor(
          0xFF9FC5F8,
          ColorGenerator.getSwatch(
            Color(0xFF9FC5F8),
          ),
        ),
        backgroundColor: MaterialColor(
          0xFFE4E5F6,
          ColorGenerator.getSwatch(
            Color(0xFFE4E5F6),
          ),
        ),
      ),
      /*routes: {
        //HomePageScreen.routeName: (ctx) => HomePageScreen(),
        '/':(ctx)=> TabsScreen(),
      },*/
      home: TabsScreen(),
    );
  }
}
