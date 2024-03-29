import "package:flutter/material.dart";
import 'appData.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:food_delivery_app/screen/foodScreen.dart';

class Textbox extends StatelessWidget {
  String text;
  bool obscureText;
  Textbox({required this.text, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey[50]),
        padding: EdgeInsets.all(10),
        child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: text,
            )));
  }
}

class LargeTextButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;
  Color textColor;

  LargeTextButton(
      {required this.text,
        required this.onPressed,
        required this.color,
        required this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){onPressed();},
      child: Container(
        child: Center(
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor))),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  late ImageProvider<Object> image = food.image;
  late String name = food.name;
  late String time = food.time;
  late int servings = food.servings;
  late ImageProvider<Object> genreImage = food.genreImage;
  late String genreName = food.genreName;
  late bool isFavorite = food.isFavorite;
  late Food food;
  FoodCard({required this.food}){}

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => FoodScreen(food: food)));},
      child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xD6808080),),

                    padding: EdgeInsets.symmetric(vertical:2, horizontal:5),
                    child: Row(
                      children: [
                        Image(image: genreImage,height:15),
                        SizedBox(width:5),
                        Text(genreName, style: TextStyle(color: Colors.white, fontSize: 15))
                      ],

                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: TextStyle(fontSize: 20, color:Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height:10),
                        Text("$time | $servings Serving", style: TextStyle(fontSize: 12.5, color:Colors.white, fontWeight: FontWeight.w400))
                      ]),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.75),
                ),

                child: Theme(
                  data: ThemeData(useMaterial3: true),
                  child: IconButton(

                    onPressed: () {Provider.of<AppData>(context, listen: false).changeFavorite(food); isFavorite = food.isFavorite; },
                    isSelected: Provider.of<AppData>(context).isFavorite(food),
                    icon: Icon(Icons.favorite_border, color: Colors.white ),
                    selectedIcon: Icon(Icons.favorite, color: Colors.pinkAccent),


                  ),
                ),
              )
            ],
          ),
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: image,
                fit: BoxFit.fill),
          )),
    );
  }
}
class Tag extends StatelessWidget {
  String text;
  Tag({required this.text});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(0, 0)),
            foregroundColor: MaterialStatePropertyAll(
                Provider.of<AppData>(context).foodType == text
                    ? Colors.white
                    : Colors.black38),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
            backgroundColor: MaterialStatePropertyAll(
                Provider.of<AppData>(context).foodType == text
                    ? Colors.deepOrange
                    : Colors.blueGrey[50]),
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            textStyle: MaterialStatePropertyAll(
                TextStyle(fontWeight: FontWeight.w700, fontSize: 12))),
        onPressed: () {
          Provider.of<AppData>(context, listen: false).changeFoodType(text);
          Provider.of<AppData>(context, listen: false).updateFoodCardList();
        },
        child: Text(text));
  }
}

class IconButtonSmall extends StatelessWidget {
  IconData icon;
  Function onPressed;
  IconButtonSmall({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      padding: EdgeInsets.all(5),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          onPressed();
        },
        icon: Icon(size: 25, icon),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 0))
        ],
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  double lon;
  double lat;
  MapScreen({required this.lon, required this.lat});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(51.5072167, -0.127585 ),
            zoom: 14));
  }
}


//Constants
const TextStyle kTitleText = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);