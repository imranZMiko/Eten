import 'package:eten/providers/userDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eten/providers/themeProvider.dart';

class AccountData extends StatefulWidget {
  AccountData({required this.title, required this.data, Key? key})
      : super(key: key);
  final String title;
  final String data;
  @override
  _AccountDataState createState() => _AccountDataState();
}

class _AccountDataState extends State<AccountData> {
  bool isEnabled = false;
  IconData icon = Icons.edit;
  TextEditingController fieldData = TextEditingController();

  @override
  void initState() {
    fieldData.text = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 25),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: fieldData,
              enabled: isEnabled,
             // initialValue: widget.data,
              decoration: InputDecoration(
                labelStyle: TextStyle(height: 0.5),
                labelText: widget.title,
                fillColor: Theme.of(context).backgroundColor,
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            color: icon == Icons.check ? Colors.green : null,
            onPressed: () {
              setState(
                () {
                  isEnabled = !isEnabled;
                  if (icon == Icons.edit)
                    icon = Icons.check;
                  else {
                    icon = Icons.edit;
                    Provider.of<UserData>(context, listen: false).updateInfo(context, widget.title, fieldData.text, Provider.of<ThemeInfo>(context, listen: false).chosenTheme);
                  }
                },
              );
            },
            icon: Icon(icon),
            iconSize: 18,
            splashRadius: 18,
          ),
        ],
      ),
    );
  }
}
