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
  List<Food> get cart => foods.where((element) => element.cart).toList();
  List<Food> get favorite => foods.where((element) => element.isFavorite).toList();
  ValueNotifier<bool> isLight = ValueNotifier(true);


  //Действия
  Future<void> onCategoryTap(FoodCategory selectedCategory) async {
    if (categories.contains(selectedCategory)) {
      categories.forEach((category) {
        category.isSelected = (category == selectedCategory);
      });
      if (selectedCategory == categories.first) {
        foodsByCategory = foods;
      } else {
        foodsByCategory = foods.where((food) => food.type == selectedCategory.type).toList();
      }
    }
  }

  Future<void> onIncreaseQuantityTap(Food food) async {
    food.quantity++;
  }

  Future<void> onDecreaseQuantityTap(Food food) async {
    if (food.quantity == 1) return;
    food.quantity--;
  }


  Future<void> onAddToCartTap(Food food) async {
    if (!food.cart) {
      food.cart = true;
    }
  }


  Future<void> onRemoveFromCartTap(Food food) async {
    food.cart = false;
  }

  Future<void> onCheckOutTap() async {
    for (var food in foods) {
      food.cart = false;
    }
  }

  Future<void> onAddRemoveFavoriteTap(Food food) async{
    if (favorite.contains(food)) {
    favorite.remove(food);
  } else {
    favorite.add(food);
  }
    food.isFavorite = !food.isFavorite;
  }

  void toggleTheme() {
    isLight.value = !isLight.value;
  }

  //Вспомогательные  методы
  String foodPrice(Food food) {
    double price = 0;
    price = food.quantity * food.price;
    return price.toString();
  }

  double get subtotal {
    double subtotal = 0;
    for(var food in cart) {
      subtotal += food.quantity * food.price;
    }
    return subtotal;
  }
}
