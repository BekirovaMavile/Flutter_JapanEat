import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/data/models/food_category.dart';
import 'package:flutter_japan_eat/ui/screens/cart_screen.dart';
import 'package:flutter_japan_eat/ui/screens/favorite_screen.dart';
import '../../data/app_data.dart';
import '../data/models/food.dart';
class FoodState {
  FoodState._();
  static final _instance = FoodState._();
  factory FoodState() => _instance;

  //Ключи
  GlobalKey<CartScreenState> cartKey = GlobalKey();
  GlobalKey<FavoriteScreenState> favoriteKey =
  GlobalKey();

  //Переменные
  List<FoodCategory> categories = AppData.categories;
  List<Food> foods = AppData.foodItems;
  List<Food> foodsByCategory = AppData.foodItems;
  // List<Food> get cart => foods.where((element) => element.cart).toList();
  List<Food> get favorite => foods.where((element) => element.isFavorite).toList();
  ValueNotifier<bool> isLigth = ValueNotifier(true);


  //Действия
  Future<void> onCategoryTap(FoodCategory selectedCategory) async {
    print('here');
    if (categories.contains(selectedCategory)) {
      print('here2');
      categories.forEach((category) {
        print(category == selectedCategory);
        category.isSelected = (category == selectedCategory);
      });
      if (selectedCategory == categories.first) {
        foodsByCategory = foods;
      } else {
        print('here3');
        foodsByCategory = foods.where((food) => food.type == selectedCategory.type).toList();
        print(foodsByCategory.length);
      }
    }
  }



  Future<void> onIncreaseQuantityTap(Food food) async {}

  Future<void> onDecreaseQuantityTap(Food food) async {}

  Future<void> onAddToCartTap(Food food) async {}

  Future<void> onRemoveFromCartTap(Food food) async {}

  Future<void> onCheckOutTap() async {}

  Future<void> onAddRemoveFavoriteTap(Food food) async{}

  void toggleTheme() {}

  //Вспомогательные  методы
  // String foodPrice(Food food) {}
  //
  // double get subtotal {}
}
