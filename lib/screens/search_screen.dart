import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchFormKey = GlobalKey<FormState>();
  var currentPage = 0;
  var ingredientCount = 1;

  Container get currentScreen {
    if (currentPage == 1) {
      ingredientCount = 1;
      return Container(
        width: 400,
        height: 80,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                splashRadius: 18,
              ),
              border: OutlineInputBorder(),
              hintText: 'Enter item name',
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Row(
              children: [
                Container(
                  width: 340,
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 5, top: 20, bottom: 5),
                    child: TextFormField(
                      enabled: index==ingredientCount-1?true:false,
                      autofocus: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(),
                        hintText: 'Enter ingredient',
                      ),
                    ),
                  ),
                ),
                if(index == ingredientCount-1) IconButton(
                  onPressed: () {
                    setState(() {
                      ingredientCount++;
                    });
                  },
                  icon: Icon(Icons.add),
                  iconSize: 23,
                  splashRadius: 18,
                ),
              ],
            );
          },
          itemCount: ingredientCount,
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search by  '),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: 150,
                  ),
                  Expanded(
                    child: TabBar(
                      onTap: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      overlayColor: null,
                      tabs: [
                        Tab(
                          text: 'Ingredients',
                        ),
                        Tab(
                          text: 'Recipe',
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Form(
          key: _searchFormKey,
          autovalidateMode: AutovalidateMode.always,
          child: currentScreen,
        ),
      ),
    );
  }
}
