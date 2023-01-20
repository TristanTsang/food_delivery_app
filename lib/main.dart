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

  final Food food = new Food(
  price: 10,
  image: AssetImage('images/food.jpg'),
  name: "Cheese Burger",
  time: "10 Min",
  servings: 1,
  genreName: "Junk Food",
  genreImage: AssetImage('images/JunkFood.png'),
  numReviews: 342,
  rating:4.3,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  );

  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
          initialRoute: 'FoodScreen',
          routes: {
            'StartScreen': (context) => StartScreen(),
            'PreferanceScreen': (context) => PreferanceScreen(),
            'MainScreen': (context) => MainScreen(),
            'FoodScreen': (context) => FoodScreen(food: Provider.of<AppData>(context).selectedFoods[0]),
          }
      ),
    );
  }
}