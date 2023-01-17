import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/Widgets.dart';
import 'package:food_delivery_app/appData.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
              SizedBox(height:30),
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
                          image: AssetImage('images/food.jpg'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hei, Granger', style: TextStyle(fontWeight: FontWeight.bold, fontSize:20)),
                            SizedBox(height:5),
                            Text('You have 23 discount tickets!', style:TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                        Image(image: AssetImage('images/logo.png'), fit: BoxFit.contain),
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
                child: Row(children: [
                  Tag(text: 'Recommended'),
                  SizedBox(width:10),
                  Tag(text: 'Junk Food'),
                  SizedBox(width:10),
                  Tag(text: 'Vegan'),
                  SizedBox(width:10),
                  Tag(text: 'Oriental Food'),
                  SizedBox(width:10),
                  Tag(text: 'Dessert'),
                ],)
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  String text;
  Tag({required this.text});
  @override
  Widget build(BuildContext context) {
    print(Provider.of<AppData>(context).foodType == text);
    print(Provider.of<AppData>(context).foodType);
    print(text);
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(Size(0,0)),
        foregroundColor: MaterialStatePropertyAll( Provider.of<AppData>(context).foodType == text ? Colors.white : Colors.black38),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        backgroundColor: MaterialStatePropertyAll(Provider.of<AppData>(context).foodType == text ? Colors.deepOrange : Colors.blueGrey[50]),
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical:5, horizontal:10)),
        textStyle: MaterialStatePropertyAll(TextStyle(fontWeight: FontWeight.w700, fontSize: 12))
      ),
      onPressed:(){Provider.of<AppData>(context, listen:false).changeFoodType(text);},
      child:  Text(text)
    );
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
