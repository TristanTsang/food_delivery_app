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
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 10,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey)),
                      Text("\$${food.price*food.quantity}0",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                  Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.45),
                      child: LargeTextButton(
                          color: Color(0xff10182b),
                          onPressed: () {},
                          text: "Check Out",
                          textColor: Colors.white)),
                ],
              )),
        ),
        body: Stack(
          clipBehavior: Clip.none,
            children: [

          ListView(
            padding:EdgeInsets.zero,
            children: [
              Image(image: food.image, fit: BoxFit.fill),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w800)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: 0,
                                minHeight: 0,
                                maxWidth: 180,
                                maxHeight: 200),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: 2),
                                Text("${food.rating}",
                                    style: TextStyle(
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(width: 5),
                                Text("(${food.numReviews} Reviews)",
                                    style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey))
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
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: IconButton(
                                      constraints: BoxConstraints(
                                        maxWidth: 30,
                                        maxHeight: 30,
                                      ),
                                      onPressed: () {
                                        Provider.of<AppData>(context,
                                                listen: false)
                                            .changeQuanity(food: food, num: -1);
                                      },
                                      icon: Icon(Icons.remove, size: 15)),
                                ),
                                SizedBox(width: 10),
                                Text("${food.quantity}",
                                    style: TextStyle(fontSize: 20)),
                                SizedBox(width: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: IconButton(
                                      constraints: BoxConstraints(
                                          maxWidth: 30, maxHeight: 30),
                                      onPressed: () {
                                        Provider.of<AppData>(context,
                                                listen: false)
                                            .changeQuanity(food: food, num: 1);
                                      },
                                      icon: Icon(Icons.add, size: 15)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(food.description,
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 15),
                      Text("Ingredients",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      SizedBox(height: 10),
                      Container(
                          height: 75,
                          child: ListView(
                            children: food.getIngredientWidgetArray(),
                            scrollDirection: Axis.horizontal,
                          ))
                    ],
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.chevron_left, size: 30, color: Colors.white)),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
                    ),

                    child: Theme(
                      data: ThemeData(useMaterial3: true),
                      child: IconButton(
                        onPressed: () {Provider.of<AppData>(context, listen: false).changeFavorite(food);},
                        isSelected: Provider.of<AppData>(context).isFavorite(food),
                        icon: Icon(Icons.favorite_border, color: Colors.white ),
                        selectedIcon: Icon(Icons.favorite, color: Colors.pinkAccent),
                      ),
                    ),
                  )
                ]),
          ),
        ]));
  }
}
