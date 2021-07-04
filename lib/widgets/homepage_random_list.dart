import 'package:eten/providers/randomProvider.dart';
import 'package:eten/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RandomList extends StatefulWidget {
  const RandomList({required this.title, required this.icon, Key? key})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  _RandomListState createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  late Future _randomFuture;

  Future _obtainRandomFuture() {
    return Provider.of<Randoms>(context, listen: false).getData();
  }

  @override
  void initState() {
    _randomFuture = _obtainRandomFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Icon(
                widget.icon,
                color: Color(0xffd4af37),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 210,
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: Consumer<Randoms>(
            builder: (ctx, list, child) {
              return FutureBuilder(
                future: _randomFuture,
                builder: (ctx, snapshot) {
                  if (list.randomList.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Item(element: (list.randomList[index]));
                      },
                      itemCount: list.randomList.length,
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting)
                    Center(
                      child: CircularProgressIndicator(),
                    );
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      child: Center(
                        child: Text('Servers are currently down'),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
