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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextFormField(
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
                  height: MediaQuery.of(context).size.height - 249.55,
                  child: SearchResults(hasNoTitle: true),
                )
              : Container(),
        ],
      ),
    );
  }
}
