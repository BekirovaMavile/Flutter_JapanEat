import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_japan_eat/data/app_data.dart';
import 'package:flutter_japan_eat/data/models/food.dart';
import 'package:flutter_japan_eat/states/food/food_state.dart';


class FoodProvider extends ChangeNotifier {
  FoodState _state;

  FoodProvider() : _state = FoodState.initial(AppData.foodItems);

  FoodState get state => _state;

  get getCartList => _state.foodList.where((element) => element.cart).toList();
  get getFavoriteList => _state.foodList.where((element) => element.isFavorite).toList();

  increaseQuantity(Food food) {
    int index = _state.foodList.indexWhere((element) => element.id == food.id);
    final List<Food> foodList = _state.foodList.map((element) {
      if (element.id == food.id) {
        return _state.foodList[index]
            .copyWith(quantity: _state.foodList[index].quantity + 1);
      }
      return element;
    }).toList();

    _state = _state.copyWith(foodList: foodList);
    notifyListeners();
    // emit(FoodState(foodList: foodList));
  }

  decreaseQuantity(Food food) {
    int index = _state.foodList.indexWhere((element) => element.id == food.id);
    final List<Food> foodList = _state.foodList.map((element) {
      if (element.id == food.id && element.quantity > 1) {
        return _state.foodList[index].copyWith(
          quantity: _state.foodList[index].quantity - 1,
        );
      }
      return element;
    }).toList();
    _state = _state.copyWith(foodList: foodList);
    notifyListeners();
  }

  addToCart(Food food){
    final List<Food> cartList = _state.foodList.map((element) {
      if (element.id == food.id) {
        return food.copyWith(cart: true);
      }
      return element;
    }).toList();
    _state = _state.copyWith(foodList: cartList);
    notifyListeners();
  }

  deleteFromCart(Food food){
    final List<Food> cartList = _state.foodList.map((element) {
      if (element.id == food.id) {
        return food.copyWith(cart: false);
      }
      return element;
    }).toList();
    _state = _state.copyWith(foodList: cartList);
    notifyListeners();
  }

  isFavoriteTab(Food food){
    int index = _state.foodList.indexWhere((element) => element.id == food.id);
    final List<Food> foodList = _state.foodList.map((element) {
      if (element.id == food.id) {
        return food.copyWith(isFavorite: !_state.foodList[index].isFavorite);
      }
      return element;
    }).toList();
    _state = _state.copyWith(foodList: foodList);
    notifyListeners();
  }

  void cleanCart(){
    final List<Food> cartList = _state.foodList.map((element) {
      return element.copyWith(cart:false);
    }).toList();
    _state = _state.copyWith(foodList: cartList);
    notifyListeners();
  }

  String priceFood(Food food){
    double price = 0;
    price = food.quantity * food.price;
    return price.toString();
  }

  double get subtotalPrice{
    double subtotal = 0;
    for (var element in _state.foodList){
      if (element.cart){
        subtotal += element.quantity * element.price;
      }
    }
    return subtotal;
  }
}