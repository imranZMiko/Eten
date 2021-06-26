import 'package:eten/screens/recipe_screen.dart';
import 'package:flutter/material.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({required this.index, Key? key}) : super(key: key);

  final int index;

  static List<Map<String, String>> list = [
    {
      'title': 'Baked Rigatoni With Sausage',
      'imageURL': 'https://spoonacular.com/recipeImages/633765-636x393.jpg',
      'id': '633765'
    },
    {
      'title': 'Beef Tenderloin With Creamy AlouetteÂ® Mushroom Sauce',
      'imageURL': 'https://spoonacular.com/recipeImages/634703-636x393.jpg',
      'id': '634703'
    },
    {
      'title': 'Peppermint Patties',
      'imageURL': 'https://spoonacular.com/recipeImages/655683-636x393.jpg',
      'id': '655683'
    },
    {
      'title': 'Rigatoni With Sweet Sausages In Creamy Tomato Sauce',
      'imageURL': 'https://spoonacular.com/recipeImages/658357-636x393.jpg',
      'id': '658357'
    },
    {
      'title': 'Turkey Enchilada Bake',
      'imageURL': 'https://spoonacular.com/recipeImages/664025-636x393.jpg',
      'id': '664025'
    },
    {
      'title': 'Valentine\'s Chicken Marsala',
      'imageURL': 'https://spoonacular.com/recipeImages/664270-636x393.jpg',
      'id': '664270'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 340,
          width: double.infinity,
          child: Image.asset(
            'Assets/Foods/${list[index]['id']}.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 0, 0, 0.65),
                Colors.transparent,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 20,
          child: GestureDetector(
            child: Text('Title', style: TextStyle(fontSize: 22),),
            onTap: () {
              print('g');
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      RecipeScreen(
                    id: list[index]['id'] as String,
                    title: list[index]['title'] as String,
                  ),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
