import 'package:flutter/material.dart';

class RecipeInfo extends StatelessWidget {
  const RecipeInfo({required this.ingredients, required this.servings, required this.minutes, Key? key}) : super(key: key);
  final String ingredients;
  final String servings;
  final String minutes;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    ingredients,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
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
                    servings,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
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
                    minutes,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
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
    );
  }
}
