import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eten/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RandomList extends StatelessWidget {
  const RandomList(
      {required this.title, required this.icon, Key? key})
      : super(key: key);
  final String title;
  final IconData icon;

  Future<List<Map<String, String>>> getData() async {
    List<Map<String, String>> result = [];

    try {
      var response1 = await http.get(
        Uri.parse(Uri.encodeFull('https://api.spoonacular.com/recipes/random?apiKey=3de7b3d7a06f401a8210e4c5a7f3ba7c&number=10')),
      );
      var data = json.decode(response1.body);
      print(data);

      if(data['status'] == 'failure'){
        return [];
      }
      else {
        for (int i = 0; i < 10; i++) {
          result.add({
            'title': data['recipes'][i]['title'],
            'imageURL':
                'https://spoonacular.com/recipeImages/${data['recipes'][i]['id']}-636x393.jpg',
            'id': '${data['recipes'][i]['id']}',
          });
        }
      }
    } catch (error) {
      print(error);
    }

    print(result.length);

    return result;
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, bottom:15, left:15, right: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Icon(icon, color: Color(0xffcd7f32),),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 210,
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: FutureBuilder(
            future: getData(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                if ((snapshot.data! as List<Map<String, String>>).isNotEmpty) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Item(
                          element: (snapshot.data!
                          as List<Map<String, String>>)[index]);
                    },
                    itemCount:
                    (snapshot.data! as List<Map<String, String>>).length,
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting)
                Center(
                  child: CircularProgressIndicator(),
                );
              return Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Card(
                child: Center(child: Text('Servers are currently down'),),
              ),);
            },
          ),
        ),
      ],
    );
  }
}
