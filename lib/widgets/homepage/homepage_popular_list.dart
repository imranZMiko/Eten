import 'package:eten/providers/popularProvider.dart';
import 'package:eten/widgets/homepage/homepage_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularList extends StatefulWidget {
  const PopularList({required this.title, required this.icon, Key? key})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  _PopularListState createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  late Future _popularFuture;

  Future _obtainPopularFuture() {
    return Provider.of<Populars>(context, listen: false).getData();
  }

  @override
  void initState() {
    _popularFuture = _obtainPopularFuture();
    super.initState();
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
                  widget.title,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Icon(widget.icon, color: Color(0xffd4af37),),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 210,
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: Consumer<Populars>(
            builder: (ctx, populars, child){
              return FutureBuilder(
                future: _popularFuture,
                builder: (ctx, snapshot) {
                    if (populars.popularList.isNotEmpty) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Item(
                              element: (populars.popularList[index]));
                        },
                        itemCount:
                        populars.popularList.length,
                      );
                    }
                  if (snapshot.connectionState == ConnectionState.waiting)
                    Center(
                      child: CircularProgressIndicator(),
                    );
                  return Container();
                },
              );
            }
          ),
        ),
      ],
    );
  }
}
