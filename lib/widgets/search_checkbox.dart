import 'package:flutter/material.dart';

class SearchCheckbox extends StatefulWidget {
  SearchCheckbox({required this.dataList, required this.type, Key? key})
      : super(key: key);
  final List<String> dataList;
  String type;
  @override
  _SearchCheckboxState createState() => _SearchCheckboxState();
}

class _SearchCheckboxState extends State<SearchCheckbox> {
  @override
  List<bool> isChecked = [];
  void initState() {
    isChecked = List<bool>.filled(widget.dataList.length, false);
    super.initState();
  }

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
                child: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Color(0xFF9FC5F8),
                  value: isChecked[index],
                  onChanged: (bool? value) {
                    setState(
                      () {
                        isChecked[index] = value!;
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
