import 'package:eten/widgets/item.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList(
      {required this.title, required this.icon, required this.list, Key? key})
      : super(key: key);
  final String title;
  final IconData icon;
  final List<Map<String, String>> list;

  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Theme.of(context).backgroundColor,
          leading: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          trailing: Icon(icon),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 210,
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Item(element: list[index]);
            },
            itemCount: list.length,
          ),
        ),
      ],
    );
  }
}
