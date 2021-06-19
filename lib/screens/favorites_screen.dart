import 'package:eten/widgets/search_results.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  static const String routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: null,
            disabledColor: Colors.yellow,
          ),
        ],
      ),
      body: SearchResults(
        hasNoTitle: true,
        ingredients: [],
      ),
    );
  }
}
