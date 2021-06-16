import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:eten/widgets/ingredients_search.dart';
import 'package:eten/widgets/recipe_search.dart';
import 'package:eten/widgets/search_results.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchFormKey = GlobalKey<FormState>();
  var currentPage = 0;
  var resultsShown = false;

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
        body: Form(
          key: _searchFormKey,
          autovalidateMode: AutovalidateMode.always,
          child: currentPage == 0
              ? (resultsShown
                  ? SearchResults(hasNoTitle: false)
                  : IngredientsSearch())
              : RecipeSearch(),
        ),
        floatingActionButton: currentPage == 0
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    resultsShown = !resultsShown;
                  });
                },
                child: Icon(resultsShown ? Icons.arrow_back : Icons.search),
              )
            : null,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
