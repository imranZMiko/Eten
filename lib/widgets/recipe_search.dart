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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
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
                              fit: BoxFit.cover, color: Theme.of(context).textTheme.bodyText1!.color),
                        ),
                      ),
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
                  height: MediaQuery.of(context).size.height - (Scaffold.of(context).appBarMaxHeight! + kBottomNavigationBarHeight + 84),
                  child: SearchResults(
                    hasNoTitle: true,
                    query: query,
                    mode: SearchMode.recipe,
                    key: ValueKey(query),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
