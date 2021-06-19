import 'package:eten/screens/recipe_screen.dart';
import 'package:eten/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../dummy_data/ImagesDummy.dart';

class SearchResults extends StatefulWidget {
  const SearchResults(
      {required this.ingredients, required this.hasNoTitle, Key? key})
      : super(key: key);
  final bool hasNoTitle;
  final List<String> ingredients;

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  String url =
      "https://api.spoonacular.com/recipes/findByIngredients?apiKey=3de7b3d7a06f401a8210e4c5a7f3ba7c&number=1&ingredients=";

  late Future<List<Map<String, String>>> _myFuture;

  @override
  void initState() {
    url =
        "https://api.spoonacular.com/recipes/findByIngredients?apiKey=3de7b3d7a06f401a8210e4c5a7f3ba7c&number=10&ranking=2&ingredients=";
    for (int i = 0; i < widget.ingredients.length; i++) {
      if (i != 0) url += ",+";
      url += "${widget.ingredients[i]}";
    }
    print(url);
    super.initState();

    _myFuture = getData();
  }

  Future<List<Map<String, String>>> getData() async {
    List<Map<String, String>> temp = [];
    print("Here");
    var response1 = await http.get(
      Uri.parse(Uri.encodeFull(url)),
    );
    print(json.decode(response1.body));

    // (json.decode(response1.body) as List<Map<String, dynamic>>).forEach((element) async {
    //   print(element);
    for(int i = 0; i < 10; i++){
      var response2 = await http.get(Uri.parse(Uri.encodeFull(
          "https://api.spoonacular.com/recipes/${json.decode(response1.body)[i]['id']}/information?includeNutrition=false&apiKey=3de7b3d7a06f401a8210e4c5a7f3ba7c")));
      temp.add({
        'title': json.decode(response2.body)['title'],
        'imageUrl': json.decode(response2.body)['image']
      });
    }
    print(temp);

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
        else {
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
                              RecipeScreen(),
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
                                  FavoriteButton(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            itemCount: data.length,
          );
        }
      },
      future: _myFuture,
    );
  }
}
