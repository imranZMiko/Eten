import 'package:flutter/material.dart';
import 'favorite_button.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({required this.id, required this.title, Key? key}) : super(key: key);
  final String id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: EdgeInsets.zero,
      elevation: 8,
      child: Stack(
        children: [
          OrientationBuilder(builder: (context, orientation) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.height,
              child: Image.network(
                'https://spoonacular.com/recipeImages/$id-636x393.jpg',
                fit: BoxFit.cover,
              ),
            );
          }),
          Positioned(
            bottom: 0,
            child: OrientationBuilder(
              builder: (context, orientation) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.width - 150
                      : MediaQuery.of(context).size.height - 50,
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
                );
              },
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
    );
  }
}
