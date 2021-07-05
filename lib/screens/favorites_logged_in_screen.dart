import 'package:eten/providers/favoritesProvider.dart';
import 'package:eten/screens/recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/auxilliary/favorite_button.dart';

class FavoritesLoggedInScreen extends StatefulWidget {
  const FavoritesLoggedInScreen({Key? key}) : super(key: key);

  @override
  _FavoritesLoggedInScreenState createState() => _FavoritesLoggedInScreenState();
}

class _FavoritesLoggedInScreenState extends State<FavoritesLoggedInScreen> {
  late Future _favoriteFuture;

  Future _obtainFavoriteFuture() {
    return Provider.of<Favorites>(context, listen: false).getData();
  }

  @override
  void initState() {
    _favoriteFuture = _obtainFavoriteFuture();
    super.initState();
  }

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
      body: Consumer<Favorites>(
        builder: (ctx, favList, child) {
          return FutureBuilder(
            builder: (ctx, snapshot) {
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  RecipeScreen(
                                id: favList.favorites[index]['id'] as String,
                                title:
                                    favList.favorites[index]['title'] as String,
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
                                favList.favorites[index]['imageUrl'] as String,
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
                                          favList.favorites[index]['title']
                                              as String,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      FavoriteButton(
                                        title: favList.favorites[index]['title']
                                            as String,
                                        id: favList.favorites[index]['id']
                                            as String,
                                        imageURL: favList.favorites[index]
                                            ['imageUrl'] as String,
                                        key: UniqueKey(),
                                      ),
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
                itemCount: favList.favorites.length,
              );
            },
            future: _favoriteFuture,
          );
        },
      ),
    );
  }
}
