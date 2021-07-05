import 'package:eten/providers/dietProvider.dart';
import 'package:eten/providers/intoleranceProvider.dart';
import 'package:eten/providers/mealProvider.dart';
import 'package:eten/providers/themeProvider.dart';
import 'package:eten/screens/recipe_screen.dart';
import 'package:eten/widgets/auxilliary/favorite_button.dart';
import 'package:eten/widgets/auxilliary/ribbon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

enum SearchMode {
  ingredients,
  recipe,
}

class SearchResults extends StatefulWidget {
  SearchResults(
      {this.ingredients = const [],
      required this.hasNoTitle,
      required this.mode,
      this.query = '',
      Key? key})
      : super(key: key);
  final bool hasNoTitle;
  final List<String> ingredients;
  final SearchMode mode;
  final String query;

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  String url = '';
  SearchMode mode = SearchMode.recipe;

  late Future<List<Map<String, String>>> _myFuture;

  @override
  void initState() {
    String query = widget.query.replaceAll(new RegExp(r"\s+"), "+");
    mode = widget.mode;
    if (mode == SearchMode.ingredients) {
      url =
          'https://api.spoonacular.com/recipes/complexSearch?apiKey=37e290723fbf4ec39f61725f2018303f&number=100&sort=min-missing-ingredients&includeIngredients=';
      for (int i = 0; i < widget.ingredients.length; i++) {
        if (i != 0) url += ",";
        String temp = widget.ingredients[i].replaceAll(new RegExp(r"\s+"), "+");
        url += temp;
      }
    } else
      url =
          'https://api.spoonacular.com/recipes/complexSearch?apiKey=37e290723fbf4ec39f61725f2018303f&number=100&sort=popularity&query=$query';

    url += Provider.of<Meals>(context, listen: false).urlPortion;
    url += Provider.of<Diets>(context, listen: false).urlPortion;
    url += Provider.of<Intolerances>(context, listen: false).urlPortion;
    print(url);
    super.initState();

    _myFuture = getData();
  }

  Future<List<Map<String, String>>> getData() async {
    List<Map<String, String>> temp = [];
    print("Here");
    // url = 'https://api.spoonacular.com/recipes/complexSearch?apiKey=3de7b3d7a06f401a8210e4c5a7f3ba7c&number=100&query=sesame%20citrus';
    print(url);
    try {
      var response1 = await http.get(
        Uri.parse(Uri.encodeFull(url)),
      );
      var data = json.decode(response1.body);
      if (data['status'] == 'failure') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Server currently down. Please try again later.'),
            backgroundColor:
                Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
                        ThemeMode.light
                    ? Colors.teal[100]
                    : Colors.teal[800],
          ),
        );
        return [
          {'title': 'failure'}
        ];
      } else {
        print(data);
        int count = data['totalResults'];
        if (count > 100) count = 100;
        if (count == 0)
          return [
            {'title': 'No results found.'}
          ];

        for (int i = 0; i < count; i++) {
          temp.add({
            'title': data['results'][i]['title'],
            'imageUrl':
                'https://spoonacular.com/recipeImages/${data['results'][i]['id']}-636x393.jpg',
            'id': '${data['results'][i]['id']}',
          });
        }
      }
    } catch (error) {
      print(error);
      return [
        {'title': 'failure'}
      ];
    }

    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if ((snapshot.data! as List<Map<String, String>>)[0]['title'] ==
            'No results found.') {
          return Center(
            child: Text('No results found.'),
          );
        } else if ((snapshot.data! as List<Map<String, String>>)[0]['title'] !=
            'failure') {
          List<Map<String, String>> data =
              snapshot.data! as List<Map<String, String>>;
          return ListView.builder(
            itemBuilder: (ctx, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index == 0)
                    Padding(
                      padding: EdgeInsets.all(widget.hasNoTitle ? 0 : 15),
                      child: widget.hasNoTitle
                          ? Container()
                          : Text(
                              'Results',
                              style: TextStyle(fontSize: 20),
                            ),
                    ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              RecipeScreen(
                            id: data[index]['id'] as String,
                            title: data[index]['title'] as String,
                          ),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width + 100,
                          child: Image.network(
                            data[index]['imageUrl'] as String,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width - 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black87,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 300,
                                    child: Text(
                                      data[index]['title'] as String,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  FavoriteButton(
                                    title: data[index]['title'] as String,
                                    id: data[index]['id'] as String,
                                    imageURL: data[index]['imageUrl'] as String,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index == data.length - 1)
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 15),
                      child: Ribbon(title: 'No more results'),
                    ),
                ],
              );
            },
            itemCount: data.length,
          );
        }
        return Container();
      },
      future: _myFuture,
    );
  }
}
