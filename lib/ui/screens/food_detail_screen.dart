import 'package:flutter/material.dart';

import '../../data/app_data.dart';
import '../../ui_kit/_ui_kit.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key});

  @override
  State<FoodDetail> createState() => FoodDetailState();
}

class FoodDetailState extends State<FoodDetail> {
  final food = AppData.food;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(child: Image.asset(food.image, scale: 2)),
        floatingActionButton: _floatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
PreferredSizeWidget _appBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: Icon(Icons.arrow_back),
    ),
    title: Text(
      'Food Detail Screen',
      style: TextStyle(color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
    ),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
  );
}

Widget _floatingActionButton() {
  final food = AppData.food;
  return FloatingActionButton(
    elevation: 0.0,
    backgroundColor: LightThemeColor.accent,
    onPressed: () {},
    child: food.isFavorite ? const Icon(AppIcon.heart) : const Icon(AppIcon.outlinedHeart),
  );
}

