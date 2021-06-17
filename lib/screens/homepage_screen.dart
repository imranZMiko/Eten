import 'package:eten/widgets/dark_mode_switch.dart';
import 'package:eten/widgets/item_list.dart';
import 'package:flutter/material.dart';
import '../dummy_data/ImagesDummy.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  child: Image.asset(
                    'Assets/Favorites.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.white10,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 10,
                  width: MediaQuery.of(context).size.width - 10,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Eten',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DarkModeSwitch(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ItemList(
              title: 'Popular',
              icon: Icons.stars,
              list: list,
            ),
            ItemList(
              title: 'Random',
              icon: Icons.shuffle,
              list: list,
            ),
          ],
        ),
      ),
    );
  }
}
