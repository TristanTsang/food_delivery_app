import "package:flutter/material.dart";

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

//Constants
const TextStyle kTitleText = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);