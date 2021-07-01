import 'package:eten/providers/themeProvider.dart';
import 'package:eten/widgets/ingredients_search.dart';
import 'package:eten/widgets/search_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:eten/widgets/recipe_search.dart';
import 'package:eten/widgets/search_results.dart';
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

  void _saveForm() {
    _searchFormKey.currentState!.save();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
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
        body: Stack(
          children: [
            Form(
              key: _searchFormKey,
              autovalidateMode: AutovalidateMode.always,
              child: currentPage == 0
                  ? (resultsShown
                      ? SearchResults(
                          mode: SearchMode.ingredients,
                          hasNoTitle: false,
                          ingredients: _ingredients,
                        )
                      : IngredientsDismissible(
                          ingredients: _ingredients,
                        ))
                  : RecipeSearch(
                      saveForm: _saveForm,
                    ),
            ),
            if(currentPage == 0)
            Positioned(
              left: -28,
              bottom: (MediaQuery.of(context).size.height / 2 -
                      (kBottomNavigationBarHeight)) -
                  20,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Provider.of<ThemeInfo>(context, listen: false)
                              .chosenTheme ==
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
                  color: Provider.of<ThemeInfo>(context, listen: false)
                              .chosenTheme ==
                          ThemeMode.light
                      ? null
                      : Colors.white,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: currentPage == 0
            ? FloatingActionButton(
                elevation: 3,
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
