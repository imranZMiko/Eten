import 'package:eten/providers/popularProvider.dart';
import 'package:eten/providers/randomProvider.dart';
import 'package:eten/widgets/auxilliary/dark_mode_switch.dart';
import 'package:eten/widgets/homepage/homepage_image.dart';
import 'package:eten/widgets/homepage/homepage_popular_list.dart';
import 'package:eten/widgets/homepage/homepage_random_list.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<Randoms>(context, listen: false).getData();
          await Provider.of<Randoms>(context, listen: false).homepageIndex();
          await Provider.of<Populars>(context, listen: false).getData();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 5,
                margin: EdgeInsets.zero,
                child: Stack(
                  children: [
                    HomeImage(),
                    Positioned(
                      top: 20,
                      left: 10,
                      width: MediaQuery.of(context).size.width - 10,
                      child: Container(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 5, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  child:
                                      Image.asset('Assets/LogoWithoutEdge.png'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 17, left: 8),
                                  child: Text(
                                    'Eten',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2),
                              child: DarkModeSwitch(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PopularList(
                title: 'Popular',
                icon: Icons.star_half,
              ),
              RandomList(
                title: 'Random',
                icon: Icons.shuffle,
                key: ValueKey('random list'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
