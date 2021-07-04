import 'package:eten/providers/themeProvider.dart';
import 'package:eten/widgets/recipe_directions.dart';
import 'package:eten/widgets/recipe_ingredients.dart';
import 'package:eten/widgets/recipe_top_info.dart';
import 'package:eten/widgets/recipe_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class RecipeScreen extends StatelessWidget {
  RecipeScreen({required this.id, required this.title, Key? key})
      : super(key: key);
  final String id;

  static const String routeName = '/recipe';

  final List<String> ingredients = [];

  final List<String> directions = [];

  final String title;

  final List<int> info = [];

  Future<String> getData(BuildContext context) async {
    String url =
        'https://api.spoonacular.com/recipes/$id/information?apiKey=37e290723fbf4ec39f61725f2018303f&includeNutrition=false';

    try {
      var response1 = await http.get(
        Uri.parse(Uri.encodeFull(url)),
      );

      var data = json.decode(response1.body);
      if (data['status'] == 'failure') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Server currently down. Please try again later.'),
            backgroundColor:
                Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
                        ThemeMode.light
                    ? Colors.teal[100]
                    : Colors.teal[800],
          ),
        );
        Navigator.of(context).pop();
        return 'failure';
      } else {
        info.add(data['servings']);
        info.add(data['readyInMinutes']);

        List<dynamic> ingredientList = data['extendedIngredients'];
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
        return 'success';
      }
    } catch (error) {
      print(error);
      return 'failure';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(context),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else if ((snapshot.data as String) == 'failure')
            return Center(child: CircularProgressIndicator());
          else
            return SingleChildScrollView(
              child: Column(
                children: [
                  RecipeImage(id: id, title: title),
                  RecipeInfo(
                    ingredients: '${ingredients.length} ',
                    servings: '${info[0]} ',
                    minutes: '${info[1]} ',
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
                  RecipeIngredients(ingredients: ingredients),
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
                  RecipeDirections(directions: directions),
                ],
              ),
            );
        },
      ),
    );
  }
}
