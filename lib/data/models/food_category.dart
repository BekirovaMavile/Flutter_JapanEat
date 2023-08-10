import 'package:flutter_japan_eat/data/models/food.dart';

// import '_models.dart';

class FoodCategory {
  final FoodType type;
  bool isSelected;

  FoodCategory(this.type, this.isSelected);
  FoodCategory copyWith({FoodType? type, bool? isSelected}) {
    return FoodCategory(
      type ?? this.type,
      isSelected ?? this.isSelected,
    );
  }
}
