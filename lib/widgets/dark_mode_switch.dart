import 'package:eten/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:provider/provider.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({Key? key}) : super(key: key);

  @override
  _DarkModeSwitchState createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  bool isDarkModeEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, right: 8),
      child: DayNightSwitcherIcon(
        isDarkModeEnabled: isDarkModeEnabled,
        onStateChanged: (isDarkModeEnabled){
          setState(() {
            this.isDarkModeEnabled = isDarkModeEnabled;
          });
          Provider.of<ThemeInfo>(context, listen: false).toggleTheme(isDarkModeEnabled);
        },
      ),
    );
  }
}
