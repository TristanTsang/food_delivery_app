import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Widgets.dart';

class AppData extends ChangeNotifier {
  String _foodType = "Recommended";
  static Food cheeseBurger = Food(
    price: 10,
    image: AssetImage('images/food.jpg'),
    name: "Cheese Burger",
    time: "10 Min",
    servings: 1,
    genreName: "Junk Food",
    genreImage: AssetImage('images/JunkFood.png'),
  );
  static Food salad = Food(
      price: 10,
      image: AssetImage('images/food.jpg'),
      name: "Salad",
      time: "15 Min",
      servings: 1,
      genreName: "Vegan",
      genreImage: AssetImage('images/JunkFood.png'));
  static Food sushi = Food(
    price: 30,
    image: AssetImage('images/food.jpg'),
    name: "Sushi",
    time: "20 Min",
    servings: 1,
    genreName: "Oriental Food",
    genreImage: AssetImage('images/OrientalFood.png'),
  );
  static Food iceCream = Food(
    price: 5,
    image: AssetImage('images/food.jpg'),
    name: "Ice Cream",
    time: "10 Min",
    servings: 1,
    genreName: "Dessert",
    genreImage: AssetImage(
      'images/Dessert.png',
    ),
  );

  static final List<Food> _foods = [cheeseBurger, salad, sushi, iceCream];

  List<Food> _selectedFoods = _foods;

  void updateSelectedFoods() {
    _selectedFoods = [];
    for (int i = 0; i < _foods.length; i++) {
      if (_foodType == _foods[i].genreName || _foodType == "Recommended") {
        _selectedFoods.add(_foods[i]);
      }
    }
    notifyListeners();
  }

  List<Widget> _foodCards = [];

  void initalizeFoodCardList(){
    for (int i = 0; i < _foods.length; i++) {
      _foodCards.add(FoodCard(food: _foods[i]));
      _foodCards.add(SizedBox(width: 15));
    }
  }

  void updateFoodCardList() {
    updateSelectedFoods();
    _foodCards = [];
    for (int i = 0; i < _selectedFoods.length; i++) {
      _foodCards.add(FoodCard( food: _selectedFoods[i]));
      _foodCards.add(SizedBox(width: 15));
    }
    notifyListeners();
  }

  void changeFoodType(String newType) {
    _foodType = newType;
    notifyListeners();
  }

  void changeFavorite(Food food){
    food.toggleFavorite();
    notifyListeners();
  }

  String get foodType {
    return _foodType;
  }

  List<Food> get selectedFoods {
    return _selectedFoods;
  }

  List<Widget> get foodCards {
    return _foodCards;
  }
  bool isFavorite(Food food){
    return food.isFavorite;
  }
}

class Food {
  late int _price;
  late ImageProvider<Object> _image;
  late String _name;
  late String _time;
  late int _servings;
  late ImageProvider<Object> _genreImage;
  late String _genreName;
  bool _isFavorite = false;

  Food(
      {required int price,
      required ImageProvider<Object> image,
      required String name,
      required String time,
      required int servings,
      required ImageProvider<Object> genreImage,
      required String genreName}) {
    _price = price;
    _image = image;
    _name = name;
    _time = time;
    _servings = servings;
    _genreImage = genreImage;
    _genreName = genreName;
  }

  void toggleFavorite(){
    _isFavorite = !_isFavorite;
  }



  String get genreName {
    return _genreName;
  }

  String get name {
    return _name;
  }

  ImageProvider<Object> get image {
    return _image;
  }

  int get price {
    return _price;
  }

  ImageProvider<Object> get genreImage {
    return _genreImage;
  }

  String get time {
    return _time;
  }

  int get servings {
    return _servings;
  }
  bool get isFavorite{
    return _isFavorite;
  }
}
