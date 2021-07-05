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
  late final List<Widget> _pages;
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
    _pages = [
      HomePageScreen(),
      WillPopScope(
        child: SearchScreen(),
        onWillPop: () async {
          _selectPage(0);
          return false;
        },
      ),
      WillPopScope(
        child: FavoritesScreen(
          key: ValueKey('favorites screen'),
        ),
        onWillPop: () async {
          _selectPage(0);
          return false;
        },
      ),
      WillPopScope(
        child: AccountScreen(),
        onWillPop: () async {
          _selectPage(0);
          return false;
        },
      ),
    ];
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
                tooltip: 'Home',
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                tooltip: 'Search',
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.search),
                activeIcon: Icon(Icons.search_outlined),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                tooltip: 'Favorite',
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star_border),
                activeIcon: Icon(Icons.star),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                tooltip: 'Account',
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.perm_identity_outlined),
                activeIcon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
          ),
        );
      },
      future: _themeFuture,
    );
  }
}
