import 'package:flutter/material.dart';

class Diets with ChangeNotifier {
  String tempDiet = 'None';
  String finalDiet = 'None';

  void setDiet(String input) {
    tempDiet = input;
  }

  void submitDiet() {
    finalDiet = tempDiet;
  }

  String get urlPortion {
    if (finalDiet == 'None')
      return '';
    else {
      String temp = finalDiet.replaceAll(new RegExp(r"\s+"), "+");
      return '&diet=$temp';
    }
  }
}
