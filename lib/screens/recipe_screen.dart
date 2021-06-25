import 'package:eten/widgets/favorite_button.dart';
import 'package:eten/widgets/recipe_check.dart';
import 'package:flutter/material.dart';
class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key}) : super(key: key);
  static const String routeName = '/recipe';




  static const List<String> ingredients = [
    'Soy Sauce',
    'Chicken',
    'Onions',
    'Chilli',
    'Cucumber',
    'Capsicum',
    'Tomato',
  ];

  static const List<String> directions = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid',
    'minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repreh',
    'velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cu',
    'ChilLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluli',
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 30,
                    child: Image.asset(
                      'Assets/Place4.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black87,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sesame Chicken',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          FavoriteButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
            ),
            ListTile(
              leading: Text(
                'Ingredients',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(
                                      Icons.restaurant_rounded,
                                      size: 18,
                                      color: Colors.yellow[700],
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      ingredients[index],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  RecipeCheck(),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.teal.shade100,
                              thickness: 0.5,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: ingredients.length,
                    shrinkWrap: true,
                  ),
                ],
              ),
            ),
            Container(
              height: 25,
            ),
            ListTile(
              leading: Text(
                'Directions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: 15),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    Icons.all_out,
                                    size: 16,
                                    color: Colors.yellow[700],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Step ${(index + 1).toString()}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                RecipeCheck(),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text(
                                directions[index],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Divider(
                              color: Colors.teal.shade100,
                              thickness: 0.5,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: directions.length,
                    shrinkWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
