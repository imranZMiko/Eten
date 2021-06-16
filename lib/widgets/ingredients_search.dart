import 'package:flutter/material.dart';

class IngredientsSearch extends StatefulWidget {
  const IngredientsSearch({Key? key}) : super(key: key);

  @override
  _IngredientsSearchState createState() => _IngredientsSearchState();
}

class _IngredientsSearchState extends State<IngredientsSearch> {
  var ingredientCount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: index == ingredientCount - 1 ? true : false,
                      //autofocus: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(),
                        hintText: 'Enter ingredient',
                      ),
                    ),
                  ),
                  if (index == ingredientCount - 1)
                    IconButton(
                      onPressed: () {
                        setState(() {
                          ingredientCount++;
                        });
                      },
                      icon: Icon(Icons.add),
                      iconSize: 23,
                      splashRadius: 18,
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      constraints: BoxConstraints(),
                    ),
                ],
              ),
            );
          },
          itemCount: ingredientCount,
        ),
      ),
    );
  }
}
