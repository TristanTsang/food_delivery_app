import 'package:flutter/material.dart';
import 'package:food_delivery_app/appData.dart';
import 'package:food_delivery_app/Widgets.dart';

class FoodScreen extends StatelessWidget {
  Food food;
  FoodScreen({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image(image: food.image),
        Container(
          padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(food.name, style: kTitleText),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth:0, minHeight:0, maxWidth:180, maxHeight:200),
                  child: ListTile(
                    minLeadingWidth:0,
                    horizontalTitleGap:0,
                    leading: Icon(Icons.star, color: Colors.yellow),
                    title: Text("${food.rating}"),
                    trailing: Text("(${food.numReviews} Reviews)")

                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.horizontal_rule)
                    ),
                    Text(""),
                    IconButton(
                      onPressed:() {},
                      icon: Icon(Icons.add)
                    )
                  ],
                ),
              ],
            ),
            Text(food.description),],
        )),

      ],
    ));
  }
}
