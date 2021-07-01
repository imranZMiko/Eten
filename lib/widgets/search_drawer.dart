import 'package:eten/providers/dietProvider.dart';
import 'package:eten/providers/intoleranceProvider.dart';
import 'package:eten/providers/mealProvider.dart';
import 'package:eten/providers/themeProvider.dart';
import 'package:eten/widgets/search_checkbox.dart';
import 'package:eten/widgets/search_radio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchDrawer extends StatelessWidget {
  SearchDrawer({Key? key}) : super(key: key);
  final List<String> _diet = [
    'Gluten Free',
    'Ketogenic',
    'Vegetarian',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian',
    'Vegan',
    'Pescetarian',
    'Paleo',
    'Primal',
    'Whole30',
    'None'
  ];
  final List<String> _intolerances = [
    'Dairy',
    'Egg',
    'Gluten',
    'Grain',
    'Peanut',
    'Seafood',
    'Sesame',
    'Shellfish',
    'Soy',
    'Sulfite',
    'Tree Nut',
    'Wheat',
  ];
  final List<String> _mealType = [
    'Main course',
    'Side dish',
    'Dessert',
    'Appetizer',
    'Salad',
    'Bread',
    'Breakfast',
    'Soup',
    'Beverage',
    'Sauce',
    'Marinade',
    'Fingerfood',
    'Snack',
    'Drink',
    'None'
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
                    ThemeMode.light
                ? Theme.of(context).primaryColor
                : Color(0xFF7b7980),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      'Filters',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 45,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 30),
              horizontalTitleGap: 0,
              tileColor:
                  Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
                          ThemeMode.light
                      ? Color(0xFFd8d9f6)
                      : Color(0xFF626166),
              leading: Icon(
                Icons.room_service,
                size: 20,
              ),
              title: Text(
                'Diet',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SearchRadio(dataList: _diet, type: 'Diet'),
          Container(height: 30),
          Container(
            height: 45,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 30),
              horizontalTitleGap: 0,
              tileColor:
                  Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
                          ThemeMode.light
                      ? Color(0xFFd8d9f6)
                      : Color(0xFF626166),
              leading: Icon(
                Icons.no_food,
                size: 20,
              ),
              title: Text(
                'Intolerance',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SearchCheckbox(dataList: _intolerances, type: 'Intolerance'),
          Container(height: 30),
          Container(
            height: 45,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 30),
              horizontalTitleGap: 0,
              tileColor:
                  Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
                          ThemeMode.light
                      ? Color(0xFFd8d9f6)
                      : Color(0xFF626166),
              leading: Icon(
                Icons.tapas,
                size: 20,
              ),
              title: Text('Meal Type'),
            ),
          ),
          SearchRadio(dataList: _mealType, type: 'Meal'),
          Container(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              primary:
                  Provider.of<ThemeInfo>(context, listen: false).chosenTheme ==
                          ThemeMode.light
                      ? Color(0xFFd8d9f6)
                      : Color(0xFF626166),
            ),
            onPressed: () {
              Provider.of<Diets>(context, listen: false).submitDiet();
              Provider.of<Meals>(context, listen: false).submitMeal();
              Provider.of<Intolerances>(context, listen: false).submitData();
              Navigator.of(context).pop();
            },
            child: Text(
              'Done',
              style: TextStyle(
                color: Provider.of<ThemeInfo>(context, listen: false)
                            .chosenTheme ==
                        ThemeMode.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
