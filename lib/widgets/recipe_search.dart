import 'package:eten/widgets/search_results.dart';
import 'package:flutter/material.dart';

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
                    onSaved: (value) {
                      query = value!;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      suffixIcon: IconButton(
                        onPressed: () {
                          widget.saveForm();
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
                  height: MediaQuery.of(context).size.height - (Scaffold.of(context).appBarMaxHeight! + kBottomNavigationBarHeight + 88),
                  child: SearchResults(
                    hasNoTitle: true,
                    query: query,
                    mode: SearchMode.recipe,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
