import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Favorites with ChangeNotifier {
  List<Map<String, String>> list = [];

  List<Map<String, String>> get favorites {
    return [...list];
  }

  Future<void> getData() async {
    print('getting');
    var firebaseUser = FirebaseAuth.instance.currentUser;

    var allDocs = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .collection('favorites').orderBy('time', descending: true)
        .get();

    list.clear();
    allDocs.docs.forEach((doc) {
      list.add({
        'title': doc['title'].toString(),
        'id': doc['id'].toString(),
        'imageUrl': doc['imageURL'].toString(),
      });
    });
    notifyListeners();
  }

  Future<bool> isFavorite(String id) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      try {
        DocumentSnapshot ref = await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .collection('favorites')
            .doc(id)
            .get();
        if(ref.exists)
          return true;
        else return false;
      } catch (err) {
        return false;
      }
    } else
      return false;
  }

  Future<void> addToFavorites(String title, String id, String imageURL) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser!.uid)
          .collection('favorites')
          .doc(id)
          .set({'title': title, 'imageURL': imageURL, 'id': id, 'time': DateTime.now().toIso8601String()});

      var ref = await FirebaseFirestore.instance
          .collection('favorites')
          .doc(id)
          .get();

      if (ref.exists)
        await FirebaseFirestore.instance.collection('favorites').doc(id).set({
          'id': ref['id'],
          'count': ref['count'] + 1,
          'title': ref['title'],
          'imageURL': ref['imageURL']
        });
      else
        await FirebaseFirestore.instance
            .collection('favorites')
            .doc(id)
            .set({'id': id, 'count': 1, 'title': title, 'imageURL': imageURL});

      await getData();
    } catch (err) {
      print(err);
    }
  }

  Future<void> removeFromFavorites(String id) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser!.uid)
          .collection('favorites')
          .doc(id)
          .delete();

      var ref = await FirebaseFirestore.instance
          .collection('favorites')
          .doc(id)
          .get();

      if (ref['count'] == 1)
        FirebaseFirestore.instance
            .collection('favorites')
            .doc(id)
            .delete();
      else
        FirebaseFirestore.instance.collection('favorites').doc(id).set({
          'id': ref['id'],
          'count': ref['count'] - 1,
          'title': ref['title'],
          'imageURL': ref['imageURL']
        });

      await getData();
    } catch (err) {
      print(err);
    }
  }

}
