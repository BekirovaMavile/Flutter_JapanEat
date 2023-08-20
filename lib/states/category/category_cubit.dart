import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_japan_eat/data/app_data.dart';
import 'package:flutter_japan_eat/data/models/food.dart';
import 'package:flutter_japan_eat/data/models/food_category.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit()
      : super(CategoryState.initial(AppData.foodItems, AppData.categories),
  );

  onCategoryTab(FoodCategory category) {
    final List<FoodCategory> categories = state.foodCategories.map((element){
      if (element == category) {
        return category.copyWith(isSelected: true);
      }
      return element.copyWith(isSelected: false);
    }).toList();

    if (category.type == FoodType.all) {
      emit(CategoryState(
          foodCategories: categories, foods: AppData.foodItems));
    } else {
      final List<Food> foods = AppData.foodItems
          .where((item) => item.type == category.type)
          .toList();
      emit(CategoryState(foods: foods, foodCategories: categories));
    }
  }

}
