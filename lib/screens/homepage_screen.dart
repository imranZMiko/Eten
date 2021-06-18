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
                Positioned(
                  top: 55,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Eten',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          child: Image.asset('Assets/LogoWithoutEdge.png'),
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
