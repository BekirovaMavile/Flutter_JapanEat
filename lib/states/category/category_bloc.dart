import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_japan_eat/data/app_data.dart';
import 'package:flutter_japan_eat/data/models/food.dart';
import 'package:flutter_japan_eat/data/models/food_category.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc()
      : super(CategoryState.initial(AppData.foodItems, AppData.categories),
  ) {
    on<CategoryTap>(_onCategoryTab);
  }

  _onCategoryTab(CategoryEvent event, Emitter<CategoryState> emit) {
    final List<FoodCategory> categories = state.foodCategories.map((element){
      if (element == event.category) {
        return event.category.copyWith(isSelected: true);
      }
      return element.copyWith(isSelected: false);
    }).toList();

    if (event.category.type == FoodType.all) {
      emit(CategoryState(
          foodCategories: categories, foods: AppData.foodItems));
    } else {
      final List<Food> foods = AppData.foodItems
          .where((item) => item.type == event.category.type)
          .toList();
      emit(CategoryState(foods: foods, foodCategories: categories));
    }
  }

}
