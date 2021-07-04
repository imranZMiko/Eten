import 'package:eten/providers/themeProvider.dart';
import 'package:eten/providers/userDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSetting extends StatefulWidget {
  const ThemeSetting({Key? key}) : super(key: key);

  @override
  _ThemeSettingState createState() => _ThemeSettingState();
}

class _ThemeSettingState extends State<ThemeSetting> {
  List<String> imageURL = [
    'Assets/AccountTheme/light1.jpg',
    'Assets/AccountTheme/light1.jpg',
    'Assets/AccountTheme/light2.jpg',
    'Assets/AccountTheme/light3.jpg',
    'Assets/AccountTheme/light4.jpg',
    'Assets/AccountTheme/light5.jpg',
    'Assets/AccountTheme/light6.jpg',
    'Assets/AccountTheme/light7.jpg',
    'Assets/AccountTheme/light8.jpg',
    'Assets/AccountTheme/light9.jpg',
    'Assets/AccountTheme/light10.jpg',
    'Assets/AccountTheme/light11.jpg',
  ];
  List<String> imageURLDark = [
    'Assets/AccountTheme/dark1.jpg',
    'Assets/AccountTheme/dark1.jpg',
    'Assets/AccountTheme/dark2.jpg',
    'Assets/AccountTheme/dark3.jpg',
    'Assets/AccountTheme/dark4.jpg',
    'Assets/AccountTheme/dark5.jpg',
    'Assets/AccountTheme/dark6.jpg',
    'Assets/AccountTheme/dark7.jpg',
    'Assets/AccountTheme/dark8.jpg',
    'Assets/AccountTheme/dark9.jpg',
    'Assets/AccountTheme/dark10.jpg',
    'Assets/AccountTheme/dark11.jpg',
  ];

  static const List<String> imageText = [
    'Current Theme',
    'Light theme 1',
    'Light theme 2',
    'Light theme 3',
    'Light theme 4',
    'Light theme 5',
    'Light theme 6',
    'Light theme 7',
    'Light theme 8',
    'Light theme 9',
    'Light theme 10',
    'Light theme 11',
  ];
  static const List<String> imageTextDark = [
    'Current Theme',
    'Dark theme 1',
    'Dark theme 2',
    'Dark theme 3',
    'Dark theme 4',
    'Dark theme 5',
    'Dark theme 6',
    'Dark theme 7',
    'Dark theme 8',
    'Dark theme 9',
    'Dark theme 10',
    'Dark theme 11',
  ];
  @override
  void initState() {
    if (Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
        ThemeMode.light)
      imageURL[0] = Provider.of<UserData>(context, listen: false).lightTheme;
    else
      imageURLDark[0] = Provider.of<UserData>(context, listen: false).darkTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Consumer<UserData>(
                  builder: (ctx, userDataSnap, child) {
                    return InkWell(
                      onTap: index == 0
                          ? null
                          : () {
                              if (Provider.of<ThemeInfo>(context, listen: false)
                                      .chosenTheme ==
                                  ThemeMode.light) {
                                userDataSnap.changeTheme(
                                    imageURL[index],
                                    Provider.of<ThemeInfo>(context,
                                            listen: false)
                                        .chosenTheme);
                                imageURL.insert(0, imageURL[index]);
                                setState(() {
                                  imageURL.removeAt(1);
                                });
                              } else {
                                userDataSnap.changeTheme(
                                    imageURLDark[index],
                                    Provider.of<ThemeInfo>(context,
                                            listen: false)
                                        .chosenTheme);
                                imageURLDark.insert(0, imageURLDark[index]);
                                setState(() {
                                  imageURLDark.removeAt(1);
                                });
                              }
                            },
                      child: Card(
                        elevation: 5.0,
                        child: Container(
                          height: 283,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 20, bottom: 20, left: 15, right: 15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        Provider.of<ThemeInfo>(context,
                                                        listen: false)
                                                    .chosenTheme ==
                                                ThemeMode.light
                                            ? imageText[index]
                                            : imageTextDark[index],
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      if (Provider.of<ThemeInfo>(context,
                                                      listen: false)
                                                  .chosenTheme ==
                                              ThemeMode.dark &&
                                          imageURLDark[index] ==
                                              imageURLDark[0])
                                        Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        ),
                                      if (Provider.of<ThemeInfo>(context,
                                                      listen: false)
                                                  .chosenTheme ==
                                              ThemeMode.light &&
                                          imageURL[index] == imageURL[0])
                                        Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Image.asset(
                                Provider.of<ThemeInfo>(context, listen: false)
                                            .chosenTheme ==
                                        ThemeMode.light
                                    ? imageURL[index]
                                    : imageURLDark[index],
                                height: 220,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            shrinkWrap: true,
            itemCount: imageURL.length,
          ),
        ],
      ),
    );
  }
}
