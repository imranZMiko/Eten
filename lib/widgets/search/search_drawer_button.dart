import 'package:eten/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({required this.drawerKey, Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> drawerKey;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -22,
      top: MediaQuery.of(context).size.height / 2 -
          (Scaffold.of(context).appBarMaxHeight! + 30),
      child: GestureDetector(
        onHorizontalDragStart: (_) {
          drawerKey.currentState!.openDrawer();
        },
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Provider.of<ThemeInfo>(context, listen: false)
                .chosenTheme ==
                ThemeMode.light
                ? null
                : Colors.black,
            fixedSize: Size(10, 60),
            padding: EdgeInsets.only(right: 19),
            alignment: Alignment.centerRight,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    topRight: Radius.circular(70))),
          ),
          onPressed: () {
            drawerKey.currentState!.openDrawer();
          },
          child: Icon(
            Icons.filter_list,
            size: 18,
            color: Provider.of<ThemeInfo>(context, listen: false)
                .chosenTheme ==
                ThemeMode.light
                ? null
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
