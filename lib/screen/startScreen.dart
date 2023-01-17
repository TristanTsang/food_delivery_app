import 'package:flutter/material.dart';
import 'LogInSignUpScreens.dart';
import "package:food_delivery_app/Widgets.dart";
class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreen();
}

class _StartScreen extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xff10182b),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: <Widget>[
                Flexible(
                    flex: 1,
                    child: Image(
                        image: AssetImage('images/startScreenImage.png'))),
                Text('The experience of buying food quickly',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 25),
                Text('The experience of buying food quickly',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.w300)),
                SizedBox(height: 50),
                LargeTextButton(
                  text: 'Sign up',
                  onPressed: () {showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return SignUpScreen();
                      });},
                  color: Colors.deepOrange,
                  textColor: Colors.white,
                ),
                LargeTextButton(
                    text: 'Login',
                    onPressed: () {showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return LogInScreen();
                        });
                    },
                    color: Colors.white,
                    textColor: Colors.black),
              ],
            ),
          ))),
    );
  }
}








