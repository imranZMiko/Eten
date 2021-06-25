import 'package:eten/widgets/favorite_button.dart';
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

  Future<void> getData() async {
    String url =
        'https://api.spoonacular.com/recipes/$id/information?apiKey=3de7b3d7a06f401a8210e4c5a7f3ba7c&includeNutrition=false';

    try {
      var response1 = await http.get(
        Uri.parse(Uri.encodeFull(url)),
      );

      print('here2');
      var data = json.decode(response1.body);

      List<dynamic> ingredientList = data['extendedIngredients'];
      print(ingredientList);
      ingredientList.forEach((element) {
        ingredients.add(element['originalName'] as String);
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
                  Stack(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ListTile(
                    leading: Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 18,
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Icon(Icons.circle_outlined),
                                  ),
                                  Expanded(
                                      child: Text(
                                    ingredients[index],
                                    style: TextStyle(fontSize: 16),
                                  )),
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
                    height: 50,
                  ),
                  ListTile(
                    leading: Text(
                      'Directions',
                      style: TextStyle(
                        fontSize: 18,
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
                              padding: EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Icon(Icons.circle_outlined),
                                  ),
                                  Expanded(
                                    child: Text(
                                      directions[index],
                                      style: TextStyle(fontSize: 16),
                                    ),
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
