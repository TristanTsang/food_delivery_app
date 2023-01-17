import 'package:flutter/foundation.dart';

class AppData extends ChangeNotifier{
String _foodType = "Recommended";
void changeFoodType(String newType){
  _foodType = newType;
  notifyListeners();
}
String get foodType{
  return _foodType;
}
}