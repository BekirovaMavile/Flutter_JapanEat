import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_japan_eat/data/app_data.dart';
import 'package:flutter_japan_eat/data/models/food.dart';
import 'package:meta/meta.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  get getCartList => state.foodList.where((element) => element.cart).toList();
  get isFavorite => state.foodList.where((element) => element.isFavorite).toList();

  FoodCubit() : super(FoodState.initial(AppData.foodItems));

  increaseQuantity(Food food) {
    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == food.id) {
        return food
            .copyWith(quantity: food.quantity + 1);
      }
      return element;
    }).toList();

    emit(FoodState(foodList: foodList));
  }

  decreaseQuantity(Food food) {
    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == food.id && element.quantity > 1) {
        return food.copyWith(quantity: food.quantity - 1);
      }
      return element;
    }).toList();
    emit(FoodState(foodList: foodList));
  }

  void addToCart(Food food){
    final List<Food> cartList = state.foodList.map((element) {
      if (element.id == food.id) {
        return food.copyWith(cart:true);
      }
      return element;
    }).toList();
    emit(FoodState(foodList: cartList));
  }

  deleteFromCart(Food food){
    final List<Food> cartList = state.foodList.map((element) {
      if (element.id == food.id) {
        return food.copyWith(cart:false);
      }
      return element;
    }).toList();
    emit(FoodState(foodList: cartList));
  }

  isFavoriteTab(Food food){
    int index = state.foodList.indexWhere((element) => element.id == food.id);
    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == food.id) {
        return food.copyWith(isFavorite: !state.foodList[index].isFavorite);
      }
      return element;
    }).toList();
    emit(FoodState(foodList: foodList));
  }
  //
  // // void _cleanCart(CleanCartEvent event, Emitter<FoodState> emit){
  // //   final List<Food> cartList = state.foodList.map((element) {
  // //       return event.food.copyWith(cart:false);
  // //   }).toList();
  // //   emit(FoodState(foodList: cartList));
  // // }
  //
  String priceFood(Food food){
    double price = 0;
    price = food.quantity * food.price;
    return price.toString();
  }

  double get subtotalPrice{
    double subtotal = 0;
    for (var element in state.foodList){
      if (element.cart){
        subtotal += element.quantity * element.price;
      }
    }
    return subtotal;
  }
}
