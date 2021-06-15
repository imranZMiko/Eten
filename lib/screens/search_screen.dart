import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  var currentPage = 0;

  Container get currentScreen{
    return Container(child: Center(child: Text(currentPage==0?'Hello':'World'),),);
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
        body: currentScreen,
      ),
    );
  }
}
