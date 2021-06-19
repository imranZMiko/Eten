import 'package:eten/screens/recipe_screen.dart';
import 'package:eten/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({required this.element, Key? key}) : super(key: key);

  final Map<String, String> element;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => RecipeScreen(),
              transitionDuration: Duration(seconds: 0),
            ),
          );
        },
        child: Card(
          child: Container(
            width: 130,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 130,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      element['imageURL'] as String,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 130,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              element['title'] as String,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
