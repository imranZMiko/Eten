import 'package:eten/screens/about_screen.dart';
import 'package:eten/screens/account_screen.dart';
import 'package:eten/screens/account_settings_screen.dart';
import 'package:eten/screens/change_password_screen.dart';
import 'package:eten/screens/favorites_screen.dart';
import 'package:eten/screens/homepage_screen.dart';
import 'package:eten/screens/log_in_screen.dart';
import 'package:eten/screens/recipe_screen.dart';
import 'package:eten/screens/register_screen.dart';
import 'package:eten/screens/search_screen.dart';
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
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(),
        AboutScreen.routeName: (ctx) => AboutScreen(),
        AccountScreen.routeName: (ctx) => AccountScreen(),
        AccountSettingsScreen.routeName: (ctx) => AccountSettingsScreen(),
        ChangePasswordScreen.routeName: (ctx) => ChangePasswordScreen(),
        FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
        HomePageScreen.routeName: (ctx) => HomePageScreen(),
        LogInScreen.routeName: (ctx) =>LogInScreen(),
        RecipeScreen.routeName: (ctx) => RecipeScreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        SearchScreen.routeName: (ctx) => SearchScreen(),
      },
    );
  }
}
