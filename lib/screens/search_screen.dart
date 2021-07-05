import 'package:eten/providers/themeProvider.dart';
import 'package:eten/widgets/search/search_by_ingredients.dart';
import 'package:eten/widgets/search/search_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:eten/widgets/search/search_by_recipe.dart';
import 'package:eten/widgets/search/search_results.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const String routeName = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchFormKey = GlobalKey<FormState>();
  var currentPage = 0;
  var resultsShown = false;
  List<String> _ingredients = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _saveForm() {
    _searchFormKey.currentState!.save();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Search by  '),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: 150,
                  ),
                  Expanded(
                    child: TabBar(
                      onTap: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      tabs: [
                        Tab(
                          text: 'Ingredients',
                        ),
                        Tab(
                          text: 'Recipe',
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        drawer: SearchDrawer(),
        body: Form(
          key: _searchFormKey,
          autovalidateMode: AutovalidateMode.always,
          child: currentPage == 0
              ? (resultsShown
                  ? SearchResults(
                      mode: SearchMode.ingredients,
                      hasNoTitle: false,
                      ingredients: _ingredients,
                    )
                  : SearchByIngredients(
                      ingredients: _ingredients,
                      drawerKey: _scaffoldKey,
                    ))
              : SearchByRecipe(
                  saveForm: _saveForm,
                  drawerKey: _scaffoldKey,
                ),
        ),

        floatingActionButton: currentPage == 0
            ? FloatingActionButton(
                elevation: 3,
                tooltip: 'SearchIngredient',
                onPressed: () {
                  _saveForm();
                  bool hasData = false;
                  _ingredients.forEach((element) {
                    if (element.isNotEmpty) {
                      hasData = true;
                    }
                  });
                  if (hasData) {
                    setState(() {
                      resultsShown = !resultsShown;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter an ingredient.'),
                        backgroundColor:
                            Provider.of<ThemeInfo>(context, listen: false)
                                        .chosenTheme ==
                                    ThemeMode.light
                                ? Colors.teal[100]
                                : Colors.teal[800],
                      ),
                    );
                  }
                },
                child: Icon(resultsShown ? Icons.arrow_back : Icons.search),
              )
            : null,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
