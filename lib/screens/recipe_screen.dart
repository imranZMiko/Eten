import 'package:eten/widgets/favorite_button.dart';
import 'package:eten/widgets/recipe_check.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeScreen extends StatelessWidget {
  RecipeScreen({required this.id, required this.title, Key? key})
      : super(key: key);
  final String id;

  static const String routeName = '/recipe';

  final List<String> ingredients = [];

  final List<String> directions = [];

  final String title;

  final List<int> info = [];

  Future<void> getData() async {
    String url =
        'https://api.spoonacular.com/recipes/$id/information?apiKey=3de7b3d7a06f401a8210e4c5a7f3ba7c&includeNutrition=false';

    try {
      var response1 = await http.get(
        Uri.parse(Uri.encodeFull(url)),
      );

      print('here2');
      var data = json.decode(response1.body);

      info.add(data['servings']);
      info.add(data['readyInMinutes']);

      List<dynamic> ingredientList = data['extendedIngredients'];
      print(ingredientList);
      ingredientList.forEach((element) {
        ingredients.add(element['originalString'] as String);
      });

      List<dynamic> sectionList = data['analyzedInstructions'];
      sectionList.forEach((section) {
        List<dynamic> steps = section['steps'];
        steps.forEach((step) {
          directions.add(step['step'] as String);
        });
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else
            return SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 8,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          child: Image.network(
                            'https://spoonacular.com/recipeImages/$id-636x393.jpg',
                            fit: BoxFit.cover,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      title,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  FavoriteButton(
                                    id: id,
                                    title: title,
                                    imageURL:
                                        'https://spoonacular.com/recipeImages/$id-636x393.jpg',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 30, left: 35, right: 35, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.restaurant_menu,
                              size: 18,
                            ),
                            Container(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${ingredients.length} ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Ingredients',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.brunch_dining,
                              size: 18,
                            ),
                            Container(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${info[0]} ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Servings',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.alarm_outlined,
                              size: 18,
                            ),
                            Container(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${info[1]} ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Minutes',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
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
            );
        },
      ),
    );
  }
}
