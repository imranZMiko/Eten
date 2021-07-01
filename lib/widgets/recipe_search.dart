import 'package:eten/providers/themeProvider.dart';
import 'package:eten/widgets/search_results.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeSearch extends StatefulWidget {
  const RecipeSearch({required this.saveForm, Key? key}) : super(key: key);
  final VoidCallback saveForm;

  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  var resultsShown = false;
  var query = '';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      child: TextFormField(
                        onSaved: (value) {
                          query = value!;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10, top: 15),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 9, left: 10, right: 20, bottom: 16),
                            child: Container(
                              height: 10,
                              width: 10,
                              child: Image.asset('Assets/LogoWithoutEdge.png',
                                  fit: BoxFit.cover,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              widget.saveForm();

                              if (query.isNotEmpty) {
                                setState(() {
                                  resultsShown = true;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Please enter a search query.'),
                                    backgroundColor: Provider.of<ThemeInfo>(
                                                    context,
                                                    listen: false)
                                                .chosenTheme ==
                                            ThemeMode.light
                                        ? Colors.teal[100]
                                        : Colors.teal[800],
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.search),
                            splashRadius: 18,
                          ),
                          border: UnderlineInputBorder(),
                          hintText: 'Enter item name',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              resultsShown
                  ? Container(
                      height: MediaQuery.of(context).size.height -
                          (Scaffold.of(context).appBarMaxHeight! +
                              kBottomNavigationBarHeight +
                              84),
                      child: SearchResults(
                        hasNoTitle: true,
                        query: query,
                        mode: SearchMode.recipe,
                        key: ValueKey(query),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height -
                          (Scaffold.of(context).appBarMaxHeight! +
                              kBottomNavigationBarHeight +
                              84),
                    ),
            ],
          ),
        ),
        Positioned(
          left: -28,
          bottom: (MediaQuery.of(context).size.height / 2 -
                  (kBottomNavigationBarHeight)) -
              20,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary:
                  Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
                          ThemeMode.light
                      ? null
                      : Colors.black,
              fixedSize: Size(10, 40),
              alignment: Alignment.centerRight,
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70),
                      topRight: Radius.circular(70))),
            ),
            onPressed: () {},
            child: Icon(
              Icons.filter_list,
              size: 18,
              color:
                  Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
                          ThemeMode.light
                      ? null
                      : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
