import 'package:flutter/material.dart';

import '../../data/models/food.dart';

class FoodListView extends StatelessWidget {
  const FoodListView({
    super.key,
    required this.foods,
    this.isReversed = false
  });

  final List<Food> foods;
  final bool isReversed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 20),
          itemBuilder: (_, index) {
            return Container(
              width: 160,
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            );
          },
          separatorBuilder: (_, __) {
            return Container(
              width: 50,
            );
          },
          itemCount: 20),
    );
  }
}
