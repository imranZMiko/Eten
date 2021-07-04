import 'package:eten/widgets/recipe_check.dart';
import 'package:flutter/material.dart';

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({required this.ingredients, Key? key}) : super(key: key);

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
