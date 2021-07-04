import 'package:eten/widgets/recipe_check.dart';
import 'package:flutter/material.dart';

class RecipeDirections extends StatelessWidget {
  const RecipeDirections({required this.directions, Key? key}) : super(key: key);

  final List<String> directions;

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
      ),);
  }
}
