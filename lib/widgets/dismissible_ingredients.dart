import 'package:eten/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IngredientsDismissible extends StatefulWidget {
  const IngredientsDismissible({required this.ingredients, Key? key}) : super(key: key);

  final List<String> ingredients;

  @override
  _IngredientsDismissibleState createState() => _IngredientsDismissibleState();
}

class _IngredientsDismissibleState extends State<IngredientsDismissible> {
  List<TextEditingController> controllers = [TextEditingController()];

  @override
  void initState() {
    widget.ingredients.removeRange(0, widget.ingredients.length);
    super.initState();
  }


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
            return Dismissible(
              direction: (index == controllers.length - 1)
                  ? DismissDirection.none
                  : DismissDirection.endToStart,
              background: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
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
              ),
              onDismissed: (direction) {
                setState(() {
                  TextEditingController temp = controllers.elementAt(index);
                  controllers.removeAt(index);
                  temp.dispose();
                });
              },
              key: UniqueKey(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                            onSaved: (text){
                              widget.ingredients.add(text!);
                            },
                          ),
                        ),
                        if (index == controllers.length - 1)
                          IconButton(
                            onPressed: () {
                              setState(() {
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
                    if (index == controllers.length - 1)
                      Container(
                        height: 90,
                      ),
                  ],
                ),
              ),
            );
          },
          itemCount: controllers.length,
        ),
      ),
    );
  }
}
