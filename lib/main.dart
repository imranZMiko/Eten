import 'package:eten/providers/themeProvider.dart';
import 'package:eten/screens/about_screen.dart';
import 'package:eten/screens/account_screen.dart';
import 'package:eten/screens/account_settings_screen.dart';
import 'package:eten/screens/change_password_screen.dart';
import 'package:eten/screens/favorites_logged_out.dart';
import 'package:eten/screens/favorites_screen.dart';
import 'package:eten/screens/homepage_screen.dart';
import 'package:eten/screens/log_in_screen.dart';
import 'package:eten/screens/recipe_screen.dart';
import 'package:eten/screens/register_screen.dart';
import 'package:eten/screens/search_screen.dart';
import 'package:eten/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import './helpers/color_generator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeInfo>(
      create: (context) => ThemeInfo(),
      child: MyApp(),
    ),
  );
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
        primaryColor: MaterialColor(
          0xFF9FC5F8,
          ColorGenerator.getSwatch(
            Color(0xFF9FC5F8),
          ),
        ),
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFe4e5f6),
        accentColor: Color(0xFF9FC5F8),
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.white54,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF101010),
        accentColor: Colors.black,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black,
      ),
      themeMode: Provider.of<ThemeInfo>(context).chosenTheme,
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(),
        AboutScreen.routeName: (ctx) => AboutScreen(),
        AccountScreen.routeName: (ctx) => AccountScreen(),
        AccountSettingsScreen.routeName: (ctx) => AccountSettingsScreen(changeHandler: (){}),
        ChangePasswordScreen.routeName: (ctx) => ChangePasswordScreen(),
        FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
        HomePageScreen.routeName: (ctx) => HomePageScreen(),
        LogInScreen.routeName: (ctx) => LogInScreen(),
        RecipeScreen.routeName: (ctx) => RecipeScreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        SearchScreen.routeName: (ctx) => SearchScreen(),
        FavoritesLoggedOutScreen.routeName: (ctx) => FavoritesLoggedOutScreen(),
      },
    );
  }
}
