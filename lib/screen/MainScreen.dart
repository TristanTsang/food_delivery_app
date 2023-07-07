import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/Widgets.dart';
import 'package:food_delivery_app/appData.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:food_delivery_app/coordinates.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Coordinates coordinates = Coordinates();
  LocationData? locationData;
  double lon = 0;
  double lat = 0;

  Future<void> updateLocationData() async {
    locationData = await coordinates.getLocationData();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<AppData>(context, listen: false).initalizeFoodCardList();

    updateLocationData().whenComplete(() {
      setState(() {
        lat = locationData!.latitude!;
        lon =locationData!.longitude!;
        print(lon);
        print(lat);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonSmall(icon: Icons.notes_rounded, onPressed: () {}),
                  Column(
                    children: [
                      Text('Location',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Row(
                        children: [
                          Image(
                              width: 15,
                              height: 15,
                              image: AssetImage('images/locationIcon.png')),
                          Text('Surakarta, INA',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ],
                  ),
                  IconButtonSmall(
                      icon: Icons.shopping_cart_outlined, onPressed: () {}),
                ],
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(12),
                constraints: BoxConstraints(
                  maxHeight: 100,
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        blurRadius: 26,
                        offset: Offset(0, 10),
                      )
                    ],
                    image: DecorationImage(
                        image: AssetImage('images/food.jpg'), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hi, Granger',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(height: 5),
                          Text('You have 23 discount tickets!',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      Image(
                          image: AssetImage('images/logo.png'),
                          fit: BoxFit.contain),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 30),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Tag(text: 'Recommended'),
                      SizedBox(width: 10),
                      Tag(text: 'Junk Food'),
                      SizedBox(width: 10),
                      Tag(text: 'Vegan'),
                      SizedBox(width: 10),
                      Tag(text: 'Oriental Food'),
                      SizedBox(width: 10),
                      Tag(text: 'Dessert'),
                    ],
                  )),
              SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Provider.of<AppData>(context).foodCards,
                ),
              ),
              SizedBox(height:30),
              Text("Near You", style: TextStyle(color:Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height:10),
              Container(
                  height: 300, child: MapScreen(lon: lon, lat: lat )),
              //Container(
              //height: 200,
              // child: MapScreen(locationData: locationData!)),
            ],
          ),
        ),
      ),
    );
  }
}

