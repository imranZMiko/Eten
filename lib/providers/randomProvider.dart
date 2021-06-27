import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Randoms with ChangeNotifier {
  List<Map<String, String>> list = [];

  List<Map<String, String>> get randomList {
    return [...list];
  }

  Future<void> getData() async {
    list.clear();
    try {
      var response1 = await http.get(
        Uri.parse(Uri.encodeFull('https://api.spoonacular.com/recipes/random?apiKey=3de7b3d7a06f401a8210e4c5a7f3ba7c&number=10')),
      );
      var data = json.decode(response1.body);

      if(data['status'] == 'failure'){
        return;
      }
      else {
        for (int i = 0; i < 10; i++) {
          list.add({
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
    print('done');
    notifyListeners();
  }
}
