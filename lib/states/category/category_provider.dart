import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_japan_eat/data/app_data.dart';
import 'package:flutter_japan_eat/data/models/food.dart';
import 'package:flutter_japan_eat/data/models/food_category.dart';
import 'package:flutter_japan_eat/states/category/category_state.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryState _state;

  CategoryProvider()
      : _state = CategoryState.initial(
    AppData.foodItems,
    AppData.categories,
  );

  CategoryState get state => _state;

  onCategoryTab(FoodCategory category) {
    final List<FoodCategory> categories = _state.foodCategories.map((element) {
      if (element == category) {
        return category.copyWith(isSelected: true);
      }
      return element.copyWith(isSelected: false);
    }).toList();

    if (category.type == FoodType.all) {
      _state = _state.copyWith(
          foods: AppData.foodItems, foodCategories: categories);
    } else {
      final List<Food> foods = AppData.foodItems
          .where((item) => item.type == category.type)
          .toList();

      _state = _state.copyWith(foods: foods, foodCategories: categories);
    }
    notifyListeners();
  }
}