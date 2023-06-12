import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/ui_kit/app_color.dart';
import '../../ui_kit/app_text_style.dart';
import '../../data/models/food.dart';
import '../screens/food_detail_screen.dart';
import '../../states/food_state.dart';

class FoodListView extends StatelessWidget {
  const FoodListView({
    super.key,
    required this.foods,
    // required this.foodsByType,
    required this.init,
    this.isReversed = false
  });

  final List<Food> foods;
  // final Map<FoodType, List<Food>> foodsByType;
  final Future<void> init;
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
            Food food = isReversed ? foods.reversed.toList()[index] : foods[index];
            return GestureDetector(
                onTap: (){
                  print('Клик на карточку');
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => const FoodDetail()
                      )
                  );
                      },
            child: Container(
              width: 160,
              decoration: BoxDecoration(
                color: isDark ?
                DarkThemeColor.primaryLight : Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(food.image, scale: 6),
                      Text(
                        "\$${food.price}",
                        style: AppTextStyle.h3Style.copyWith(color: LightThemeColor.accent),
                      ),
                      Text(
                        food.name,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
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
