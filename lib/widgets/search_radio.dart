import 'package:eten/providers/dietProvider.dart';
import 'package:eten/providers/mealProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchRadio extends StatefulWidget {
  SearchRadio({required this.dataList, required this.type, Key? key})
      : super(key: key);
  final List<String> dataList;
  final String type;

  @override
  _SearchRadioState createState() => _SearchRadioState();
}

class _SearchRadioState extends State<SearchRadio> {
  late String controlValue;

  @override
  void initState() {
    if(widget.type == 'Diet')
      controlValue = Provider.of<Diets>(context, listen: false).finalDiet;
    else if(widget.type == 'Meal')
      controlValue = Provider.of<Meals>(context, listen: false).finalMeal;
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
                child: Radio<String>(activeColor: Color(0xFF9FC5F8),
                  value: widget.dataList[index],
                  groupValue: controlValue,
                  onChanged: (String? value) {
                    setState(
                      () {
                        if(widget.type == 'Diet') {
                          controlValue = value!;
                          Provider.of<Diets>(context, listen: false).setDiet(value);
                        }
                        else if(widget.type == 'Meal') {
                          controlValue = value!;
                          Provider.of<Meals>(context, listen: false).setMeal(value);
                        }
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
