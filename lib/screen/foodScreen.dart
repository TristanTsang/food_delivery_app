import 'package:flutter/material.dart';
import 'package:food_delivery_app/appData.dart';
import 'package:food_delivery_app/Widgets.dart';
import 'package:provider/provider.dart';

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
            Text(food.name, style: TextStyle(fontSize:30, fontWeight:FontWeight.w800)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth:0, minHeight:0, maxWidth:180, maxHeight:200),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width:2),
                      Text("${food.rating}", style: TextStyle(fontSize:17.5, fontWeight:FontWeight.w600)),
                      SizedBox(width:5),
                      Text("(${food.numReviews} Reviews)",style: TextStyle(fontSize:12.5, fontWeight:FontWeight.w400, color: Colors.grey))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[50],
                  ),
                  padding: EdgeInsets.all(5),

                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),

                        child: IconButton(
                          onPressed: (){
                            Provider.of<AppData>(context, listen: false).changeQuanity(food: food, num:-1);
                          },
                          icon: Icon(Icons.horizontal_rule)
                        ),
                      ),
                      SizedBox(width:5),
                      Text("${food.quantity}"),
                      SizedBox(width:5),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed:() {
                            Provider.of<AppData>(context, listen: false).changeQuanity(food: food, num:1);
                          },
                          icon: Icon(Icons.add)
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height:15),
            Text(food.description),
            SizedBox(height:15),
            Text("Ingredients", style: TextStyle(fontWeight: FontWeight.bold, fontSize:20))
          ],
        )),

      ],
    ));
  }
}
