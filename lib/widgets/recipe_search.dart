import 'package:eten/widgets/search_results.dart';
import 'package:flutter/material.dart';

class RecipeSearch extends StatefulWidget {
  const RecipeSearch({Key? key}) : super(key: key);

  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  var resultsShown = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            resultsShown = true;
                          });
                        },
                        icon: Icon(Icons.search),
                        splashRadius: 18,
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Enter item name',
                    ),
                  ),
                ),
              ),
            ],
          ),
          resultsShown
              ? Container(
                  height: MediaQuery.of(context).size.height - 249.55,
                  child: SearchResults(hasNoTitle: true, ingredients: [],),
                )
              : Container(),
        ],
      ),
    );
  }
}
