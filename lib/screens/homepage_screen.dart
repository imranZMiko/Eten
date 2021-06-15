import 'package:flutter/material.dart';
import '../dummy_data/ImagesDummy.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                child: Image.asset(
                  'Assets/Favorites.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Eten',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.yellow[100],
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Text("Popular"),
            trailing: Icon(Icons.stars),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        width: 130,
                        height: 150,
                        child: Image.asset(
                          list[index]['imageURL'] as String,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: list.length,
            ),
          ),
          ListTile(
            leading: Text("Random"),
            trailing: Icon(Icons.stars),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        width: 130,
                        height: 150,
                        child: Image.asset(
                          list[index]['imageURL'] as String,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: list.length,
            ),
          ),
        ],
      ),
    );
  }
}
