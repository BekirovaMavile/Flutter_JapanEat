import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_japan_eat/data/app_data.dart';
import 'package:flutter_japan_eat/data/models/food.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  get getCartList => state.foodList.where((element) => element.cart).toList();
  get isFavorite => state.foodList.where((element) => element.isFavorite).toList();

  FoodBloc() : super(FoodState.initial(AppData.foodItems)) {
    on<IncreaseQuantityEvent>(_increaseQuantity);
    on<DecreaseQuantityEvent>(_decreaseQuantity);
    on<AddToCartEvent>(_addToCart);
    on<DeleteFromCartEvent>(_deleteFromCart);
    on<FavoriteListEvent>(_isFavorite);
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

  void _deleteFromCart(DeleteFromCartEvent event, Emitter<FoodState> emit){
    final List<Food> cartList = state.foodList.map((element) {
      if (element.id == event.food.id) {
        return event.food.copyWith(cart:false);
      }
      return element;
    }).toList();
    emit(FoodState(foodList: cartList));
  }

  void _isFavorite(FavoriteListEvent event, Emitter<FoodState> emit){
    int index = state.foodList.indexWhere((element) => element.id == event.food.id);
    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == event.food.id) {
        return event.food
            .copyWith(isFavorite: !state.foodList[index].isFavorite);
      }
      return element;
    }).toList();
    emit(FoodState(foodList: foodList));
  }

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
