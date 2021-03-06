import 'package:eten/providers/dietProvider.dart';
import 'package:eten/providers/favoritesProvider.dart';
import 'package:eten/providers/intoleranceProvider.dart';
import 'package:eten/providers/mealProvider.dart';
import 'package:eten/providers/popularProvider.dart';
import 'package:eten/providers/randomProvider.dart';
import 'package:eten/providers/themeProvider.dart';
import 'package:eten/providers/userDataProvider.dart';
import 'package:eten/screens/about_screen.dart';
import 'package:eten/screens/account_screen.dart';
import 'package:eten/screens/account_settings_screen.dart';
import 'package:eten/screens/account_logged_out_screen.dart';
import 'package:eten/screens/auth_change_password_screen.dart';
import 'package:eten/screens/favorites_logged_out_screen.dart';
import 'package:eten/screens/favorites_screen.dart';
import 'package:eten/screens/homepage_screen.dart';
import 'package:eten/screens/auth_log_in_screen.dart';
import 'package:eten/screens/recipe_screen.dart';
import 'package:eten/screens/auth_register_screen.dart';
import 'package:eten/screens/search_screen.dart';
import 'package:eten/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import './helpers/color_generator.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: ThemeInfo()),
      ChangeNotifierProvider.value(value: Favorites()),
      ChangeNotifierProvider.value(value: Randoms()),
      ChangeNotifierProvider.value(value: Populars()),
      ChangeNotifierProvider.value(value: UserData()),
      ChangeNotifierProvider.value(value: Diets()),
      ChangeNotifierProvider.value(value: Meals()),
      ChangeNotifierProvider.value(value: Intolerances()),
    ],
    child: MyApp(),
  ));
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
        backgroundColor: const Color(0xFFecedf6),
        accentColor: Color(0xFF9FC5F8),
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.white54,
        fontFamily: 'Quicksand',
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF101010),
        accentColor: Colors.black,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black,
        fontFamily: 'Quicksand',
      ),
      themeMode: Provider.of<ThemeInfo>(context).chosenTheme,
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(),
        AboutScreen.routeName: (ctx) => AboutScreen(),
        AccountScreen.routeName: (ctx) => AccountScreen(),
        AccountSettingsScreen.routeName: (ctx) => AccountSettingsScreen(),
        ChangePasswordScreen.routeName: (ctx) => ChangePasswordScreen(),
        FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
        HomePageScreen.routeName: (ctx) => HomePageScreen(),
        LogInScreen.routeName: (ctx) => LogInScreen(),
        RecipeScreen.routeName: (ctx) => RecipeScreen(
              id: '',
              title: '',
            ),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        SearchScreen.routeName: (ctx) => SearchScreen(),
        FavoritesLoggedOutScreen.routeName: (ctx) => FavoritesLoggedOutScreen(),
        AccountsLoggedOutScreen.routeName: (ctx) => AccountsLoggedOutScreen(),
      },
    );
  }
}
