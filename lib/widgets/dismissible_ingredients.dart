import 'package:eten/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IngredientsDismissible extends StatefulWidget {
  const IngredientsDismissible({required this.ingredients, Key? key})
      : super(key: key);

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
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 10),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.all_inbox,
                size: 16,
              ),
            ),
            Expanded(
              child: Text(
                'List your ingredients',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Container(
          child: ListView.builder(
            padding: EdgeInsets.zero,
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
                        : Colors.teal[800],
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: controllers[index],
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 10, top: 15),
                                  border: UnderlineInputBorder(),
                                  hintText: 'Enter ingredient',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        top: 12,
                                        left: 12,
                                        right: 22,
                                        bottom: 17),
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      child: Image.asset(
                                          'Assets/LogoWithoutEdge.png',
                                          fit: BoxFit.cover,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color),
                                    ),
                                  ),
                                ),
                                onSaved: (text) {
                                  widget.ingredients.add(text!);
                                },
                              ),
                            ),
                          ),
                          if (index != controllers.length - 1)
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.delete_sweep_outlined,
                                size: 16,
                              ),
                            ),
                          if (index == controllers.length - 1)
                            IconButton(
                              onPressed: () {
                                if (controllers[index].text == '') {
                                  ScaffoldMessenger.of(ctx).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Please enter an ingredient.'),
                                      backgroundColor: Provider.of<ThemeInfo>(
                                                      context,
                                                      listen: false)
                                                  .chosenTheme ==
                                              ThemeMode.light
                                          ? Colors.teal[100]
                                          : Colors.teal[800],
                                    ),
                                  );
                                } else {
                                  setState(() {
                                    controllers.add(TextEditingController());
                                  });
                                }
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
      ),
    ]);
  }
}
