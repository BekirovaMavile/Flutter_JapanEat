import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/states/food_state.dart';
import 'package:simple_animations/simple_animations.dart';

import 'data/models/food.dart';

void main() =>
    runApp(const MaterialApp(home: Scaffold(body: Center(child: Page()))));

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);
  Food get food => FoodState().foodById(foodId);

  int get foodId => FoodState().selectedFood;



  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 100.0, end: 200.0),
      duration: const Duration(seconds: 2),
      delay: const Duration(seconds: 1),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: (){},
          // children:[
          // const Text("Checkout"),
        child: Container(
          width: value,
          height: 50.0,
        // child: const Text("Checkout"),
        //   color: Colors.orange,
        ),

        );
      },
    );
  }
    // return PlayAnimationBuilder<double>(
    //   tween: Tween(begin: 0.0, end: 200.0),
    //   duration: const Duration(seconds: 2),
    //   curve: Curves.easeOut,
    //   builder: (context, value, child) {
    //     return Image.asset(food.image, width: value, height: value);
    //     // return Container(
    //     //   width: value,
    //     //   height: value,
    //     //   color: Colors.pink,
    //     // );
    //   },
    // );
}