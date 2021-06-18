import 'package:eten/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

import '../dummy_data/ImagesDummy.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({required this.hasNoTitle, Key? key}) : super(key: key);
  final bool hasNoTitle;

  @override
  _SearchResultsState createState() => _SearchResultsState(hasNoTitle);
}

class _SearchResultsState extends State<SearchResults> {
  _SearchResultsState(this.hasNoTitle);
  final bool hasNoTitle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0)
              Padding(
                padding: EdgeInsets.all(hasNoTitle ? 0 : 15),
                child: hasNoTitle
                    ? Container()
                    : Text(
                        'Results',
                        style: TextStyle(fontSize: 20),
                      ),
              ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width + 100,
                  child: Image.asset(
                    list[index]['imageURL'] as String,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            list[index]['title'] as String,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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
          ],
        );
      },
      itemCount: list.length,
    );
  }
}
