import 'package:eten/providers/themeProvider.dart';
import 'package:eten/screens/account_screen.dart';
import 'package:eten/screens/favorites_screen.dart';
import 'package:eten/screens/homepage_screen.dart';
import 'package:eten/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();

  static const String routeName = '/';
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    HomePageScreen(),
    SearchScreen(),
    FavoritesScreen(
      key: ValueKey('favorites screen'),
    ),
    AccountScreen(),
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  late Future _themeFuture;

  Future _obtainThemeFuture() {
    return Provider.of<ThemeInfo>(context, listen: false).getTheme();
  }

  @override
  void initState() {
    _themeFuture = _obtainThemeFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting)
          return Container();
        return Scaffold(
          body: _pages[_selectedPageIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            currentIndex: _selectedPageIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.search),
                  activeIcon: Icon(Icons.search_outlined),
                  label: 'Search'),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.star_border),
                  activeIcon: Icon(Icons.star),
                  label: 'Favorite'),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.perm_identity_outlined),
                  activeIcon: Icon(Icons.person),
                  label: 'Account'),
            ],
          ),
        );
      },
      future: _themeFuture,
    );
  }
}
