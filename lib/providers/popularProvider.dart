import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Populars with ChangeNotifier {
  List<Map<String, String>> _list = [];

  List<Map<String, String>> get popularList {
    return [..._list];
  }
  Future<void> getData() async {
    _list.clear();
    var ref = await FirebaseFirestore.instance
        .collection('favorites')
        .orderBy('count')
        .limit(10)
        .get();

    ref.docs.forEach((element) {
      _list.add({
        'title': element['title'],
        'imageURL': element['imageURL'],
        'id': element['id']
      });
    });
    notifyListeners();
  }
}
