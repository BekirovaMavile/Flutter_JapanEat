import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_japan_eat/data/models/food.dart';

@immutable

class FoodState {
  final List<Food> foodList;

  const FoodState({required this.foodList});

  const FoodState.initial(List<Food> foodList) : this(foodList: foodList);

  @override
  List<Object?> get props => [foodList];

  FoodState copyWith({List<Food>? foodList}) {
    return FoodState(foodList: foodList ?? this.foodList);
  }

}

