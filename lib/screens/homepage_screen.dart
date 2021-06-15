import 'package:eten/widgets/item_list.dart';
import 'package:flutter/material.dart';
import '../dummy_data/ImagesDummy.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

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
                Positioned(
                  top: 55,
                  width: MediaQuery.of(context).size.width,
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
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.wb_sunny_outlined,
                            color: Colors.yellow[100],
                            size: 30,
                          ),
                        ),
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
