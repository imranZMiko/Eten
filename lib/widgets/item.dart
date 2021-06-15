import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({required this.element, Key? key}) : super(key: key);

  final Map<String, String> element;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 130,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 130,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  element['imageURL'] as String,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // FittedBox(child: ),
            Expanded(
              child: Container(
                width: 130,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Hello hello hello helo hello hello',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.star),
                      onPressed: () {},
                      visualDensity: VisualDensity.compact,
                      iconSize: 20,
                      alignment: Alignment.center,
                      color: Colors.yellow[700],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
