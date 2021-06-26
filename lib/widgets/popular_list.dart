import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eten/widgets/item.dart';
import 'package:flutter/material.dart';

class PopularList extends StatelessWidget {
  const PopularList({required this.title, required this.icon, Key? key})
      : super(key: key);
  final String title;
  final IconData icon;

  Future<List<Map<String, String>>> getData() async {
    List<Map<String, String>> result = [];

    var ref = await FirebaseFirestore.instance
        .collection('favorites')
        .orderBy('count')
        .limit(10)
        .get();

    ref.docs.forEach((element) {
      result.add({
        'title': element['title'],
        'imageURL': element['imageURL'],
        'id': element['id']
      });
    });

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
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Icon(icon, color: Color(0xffd4af37),),
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
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
