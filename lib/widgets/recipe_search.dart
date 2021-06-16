import 'package:flutter/material.dart';

class RecipeSearch extends StatelessWidget {
  const RecipeSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  splashRadius: 18,
                ),
                border: OutlineInputBorder(),
                hintText: 'Enter item name',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
