import 'package:flutter/material.dart';
import 'package:food_delivery_app/Widgets.dart';
import 'package:slide_to_act/slide_to_act.dart';

class PreferanceScreen extends StatefulWidget {
  const PreferanceScreen({Key? key}) : super(key: key);

  @override
  State<PreferanceScreen> createState() => _PreferanceScreenState();
}

class _PreferanceScreenState extends State<PreferanceScreen> {
  goToMainPage(){
    Navigator.pushNamed(context, 'MainScreen');
  }
  Color sliderColor = Color(0xff10182b);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                padding:
                    EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Choose one your favorite food', style: kTitleText),
                      Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularImageButton(onPressed:goToMainPage, text: 'Junk Food', radius: 67, image:AssetImage('images/JunkFood.png')),
                                SizedBox(width: 20),
                                CircularImageButton(onPressed:goToMainPage, text: 'Meat', radius: 67, image:AssetImage('images/Meat.png')),
                              ]),
                          SizedBox(height: 25),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularImageButton(onPressed:goToMainPage, text: 'Oriental Food', radius: 67, image:AssetImage('images/OrientalFood.png')),
                                SizedBox(width: 20),
                                CircularImageButton(onPressed:goToMainPage, text: 'Dessert', radius: 67, image:AssetImage('images/Dessert.png')),
                              ]),
                        ],
                      ),
                      SlideAction(
                          outerColor: sliderColor,
                          sliderRotate: false,
                          sliderButtonIcon: Icon(Icons.arrow_forward_ios),
                          onSubmit: () {
                            goToMainPage();
                            setState(() {
                              sliderColor = Colors.deepOrange;
                            });
                          }),
                    ]))));
  }
}

class CircularImageButton extends StatelessWidget {
  Function onPressed;
  String text;
  double radius;
  ImageProvider image;
  CircularImageButton(
      {required this.onPressed, required this.text, required this.radius, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {onPressed();},
          child: CircleAvatar(
            backgroundColor: Colors.blueGrey[50],
            radius: radius,
            child: Image(
              width: radius,
              height: radius,
              image: image,
            ),
          ),
        ),
        Text(
            text,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
