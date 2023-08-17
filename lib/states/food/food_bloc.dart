import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_japan_eat/data/app_data.dart';
import 'package:flutter_japan_eat/data/models/food.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  get getCartList => state.foodList.where((element) => element.cart).toList();

  FoodBloc() : super(FoodState.initial(AppData.foodItems)) {
    on<IncreaseQuantityEvent>(_increaseQuantity);
    on<DecreaseQuantityEvent>(_decreaseQuantity);
    on<AddToCartEvent>(_addToCart);
  }

  _increaseQuantity(IncreaseQuantityEvent event, Emitter<FoodState> emit) {
    int index = state.foodList.indexWhere((element) => element.id == event.food.id);
    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == event.food.id) {
        return state.foodList[index]
            .copyWith(quantity: state.foodList[index].quantity + 1);
      }
      return element;
    }).toList();

    emit(FoodState(foodList: foodList));
  }

  void _decreaseQuantity(DecreaseQuantityEvent event, Emitter<FoodState> emit) {
    int index = state.foodList.indexWhere((element) => element.id == event.food.id);
    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == event.food.id && element.quantity > 1) {
        return state.foodList[index]
            .copyWith(quantity: state.foodList[index].quantity - 1);
      }
      return element;
    }).toList();
    emit(FoodState(foodList: foodList));
  }

void _addToCart(AddToCartEvent event, Emitter<FoodState> emit){
  int index = state.foodList.indexWhere((element) => element.id == event.food.id);
  final List<Food> cartList = state.foodList.map((element) {
    if (element.id == event.food.id) {
      return state.foodList[index].copyWith(cart:true);
    }
    return element;
  }).toList();
  emit(FoodState(foodList: cartList));
}
}
