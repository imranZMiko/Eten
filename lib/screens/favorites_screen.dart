import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eten/screens/favorites_logged_out.dart';
import 'package:eten/screens/recipe_screen.dart';
import 'package:eten/widgets/favorite_button.dart';
import 'package:eten/widgets/search_results.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  static const String routeName = '/favorites';

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<Map<String, String>> favorites = [];

  void refresh(){
    setState(() {});
  }

  Future<void> getData() async {
    print('getting');
    var firebaseUser = FirebaseAuth.instance.currentUser;

    var allDocs = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .collection('favorites')
        .get();

    favorites.clear();
    allDocs.docs.forEach((doc) {
      favorites.add({
        'title': doc['title'].toString(),
        'id': doc['id'].toString(),
        'imageUrl': doc['imageURL'].toString(),
      });
    });
    print(favorites);
    print('herex');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
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
            body: FutureBuilder(
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
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            RecipeScreen(
                                      id: favorites[index]['id'] as String,
                                      title:
                                          favorites[index]['title'] as String,
                                    ),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                );
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width + 100,
                                    child: Image.network(
                                      favorites[index]['imageUrl'] as String,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.width -
                                              100,
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
                                                favorites[index]['title']
                                                    as String,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            FavoriteButton(
                                              title: favorites[index]['title']
                                                  as String,
                                              id: favorites[index]['id']
                                                  as String,
                                              imageURL: favorites[index]
                                                  ['imageUrl'] as String,
                                              refreshFn: refresh,
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
                    itemCount: favorites.length,
                );
              },
              future: getData(),
            ),
          );
        }
        if (userSnapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();
        return FavoritesLoggedOutScreen();
      },
    );
  }
}
