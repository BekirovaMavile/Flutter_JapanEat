import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/ui_kit/app_color.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 200,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 20),
          itemBuilder: (_, index) {
            return Container(
              width: 160,
              decoration: BoxDecoration(
                color: isDark ?
                DarkThemeColor.primaryLight : Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
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
