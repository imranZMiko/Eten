import 'package:eten/providers/randomProvider.dart';
import 'package:eten/screens/recipe_screen.dart';
import 'package:eten/widgets/ribbon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({Key? key}) : super(key: key);


  static List<Map<String, String>> list = [
    {
      "title": "Flank Steak with Mushroom Sauce",
      'imageURL': 'https://spoonacular.com/recipeImages/631750-636x393.jpg',
      "id": '631750',
    },
    {
      "title": "Blue Cheese Tartlets With Fig Jam and Walnuts",
      'imageURL': 'https://spoonacular.com/recipeImages/635370-636x393.jpg',
      "id": '635370',
    },
    {
      "title": "Dulce De Leche Crème Brûlée",
      'imageURL': 'https://spoonacular.com/recipeImages/641727-636x393.jpg',
      "id": '641727',
    },
    {
      "title": "Meyer Lemon Cheesecake",
      'imageURL': 'https://spoonacular.com/recipeImages/651757-636x393.jpg',
      "id": '651757',
    },
    {
      'title': 'Beef Tenderloin With Creamy AlouetteÂ® Mushroom Sauce',
      'imageURL': 'https://spoonacular.com/recipeImages/634703-636x393.jpg',
      'id': '634703'
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
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child: Image.asset(
            'Assets/Foods/${list[Provider.of<Randoms>(context).index]['id']}.jpg',
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
          bottom: 5,
          child: GestureDetector(
            child: Ribbon(title: list[Provider.of<Randoms>(context, listen: false).index]['title'] as String),
            onTap: () {
              print('g');
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      RecipeScreen(
                    id: list[Provider.of<Randoms>(context, listen: false).index]['id'] as String,
                    title: list[Provider.of<Randoms>(context, listen: false).index]['title'] as String,
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
