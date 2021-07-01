import 'package:flutter/material.dart';

class Intolerances with ChangeNotifier {
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
    'Tree+Nut',
    'Wheat',
  ];

  List<bool> _isCheckedTemp = List<bool>.filled(12, false);
  List<bool> _isCheckedFinal = List<bool>.filled(12, false);

  List<bool> get initialChecks {
    return [..._isCheckedFinal];
  }

  void setChecked(int index, bool value){
    _isCheckedTemp[index] = value;
  }

  void submitData(){
    _isCheckedFinal = _isCheckedTemp;
  }

  String get urlPortion{
    String temp = '&intolerances=';
    bool hasChecked = false;

    for(int i = 0; i < _isCheckedFinal.length; i++){
      if(_isCheckedFinal[i]){
        hasChecked = true;
        temp += _intolerances[i];
        if(i != _isCheckedFinal.length - 1)
          temp += ',';
      }
    }

    if(!hasChecked)
      temp = '';

    return temp;
  }

}
