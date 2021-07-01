import 'package:flutter/material.dart';

class SearchRadio extends StatefulWidget {
  SearchRadio({required this.dataList, required this.type, Key? key})
      : super(key: key);
  final List<String> dataList;
  String type;

  @override
  _SearchRadioState createState() => _SearchRadioState();
}

class _SearchRadioState extends State<SearchRadio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.dataList.length * 35.0,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            height: 35,
            width: 80,
            child: ListTile(
              horizontalTitleGap: 0,
              title: Text(
                widget.dataList[index],
                style: TextStyle(fontSize: 14),
              ),
              leading: Transform.scale(
                scale: 0.8,
                child: Radio<String>(activeColor: Color(0xFF9FC5F8),
                  value: widget.dataList[index],
                  groupValue: widget.type,
                  onChanged: (String? value) {
                    setState(
                      () {
                        widget.type = value!;
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
        itemCount: widget.dataList.length,
        shrinkWrap: true,
      ),
    );
  }
}
