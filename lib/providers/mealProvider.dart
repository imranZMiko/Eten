import 'package:flutter/material.dart';

class Meals with ChangeNotifier {
  String tempMeal = 'None';
  String finalMeal = 'None';

  void setMeal(String input){
    tempMeal = input;
  }

  void submitMeal(){
    finalMeal = tempMeal;
  }

  String get urlPortion{
    if(finalMeal == 'None')
      return '';
    else {
      String temp = finalMeal.replaceAll(new RegExp(r"\s+"), "+");
      return '&type=$temp';
    }
  }

}
