import 'package:eten/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IngredientsDismissible extends StatefulWidget {
  const IngredientsDismissible({Key? key}) : super(key: key);

  @override
  _IngredientsDismissibleState createState() => _IngredientsDismissibleState();
}

class _IngredientsDismissibleState extends State<IngredientsDismissible> {
  List<String> ingredients = [];
  List<TextEditingController> controllers = [TextEditingController()];

  @override
  void dispose() {
    for (TextEditingController a in controllers) a.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                direction: (index == ingredients.length)
                    ? DismissDirection.none
                    : DismissDirection.endToStart,
                background: Container(
                  color: Provider.of<ThemeInfo>(context, listen: false)
                              .chosenTheme ==
                          ThemeMode.light
                      ? Colors.teal[100]
                      : Colors.teal[900],
                  child: Align(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.delete),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    ingredients.removeAt(index);
                    TextEditingController temp = controllers.elementAt(index);
                    controllers.removeAt(index);
                    temp.dispose();
                    print(ingredients);
                  });
                },
                key: UniqueKey(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: controllers[index],
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: OutlineInputBorder(),
                                hintText: 'Enter ingredient',
                              ),
                            ),
                          ),
                          if (index == ingredients.length)
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  ingredients.add(controllers[index].text);
                                  controllers.add(TextEditingController());
                                });
                              },
                              icon: Icon(Icons.add),
                              iconSize: 23,
                              splashRadius: 18,
                              padding: EdgeInsets.all(8),
                              constraints: BoxConstraints(),
                            ),
                        ],
                      ),
                      if (index == ingredients.length)
                        Container(
                          height: 90,
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: ingredients.length + 1,
        ),
      ),
    );
  }
}
