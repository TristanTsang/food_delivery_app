import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/startScreen.dart';
import 'package:food_delivery_app/screen/preferanceScreen.dart';
import 'package:food_delivery_app/screen/MainScreen.dart';
import 'package:provider/provider.dart';
import 'appData.dart';
import 'package:food_delivery_app/screen/foodScreen.dart';
import 'appData.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
          initialRoute: 'StartScreen',
          routes: {
            'StartScreen': (context) => StartScreen(),
            'PreferanceScreen': (context) => PreferanceScreen(),
            'MainScreen': (context) => MainScreen(),
          }
      ),
    );
  }
}