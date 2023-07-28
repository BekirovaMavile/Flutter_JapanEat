import 'package:flutter/material.dart';
import 'models/food.dart';
import 'models/bottom_navigation_item.dart';
import 'models/food_category.dart';
import '../ui_kit/_ui_kit.dart';
// import 'models/_models.dart';

class AppData {
  const AppData._();

  static const dummyText = "Lorem Ipsum is simply dummy text of the printing and typesetting "
      "industry. Lorem Ipsum has been the industry's standard dummy text ever "
      "since the 1500s, when an unknown printer took a galley of type and "
      "scrambled it to make a type specimen book. It has survived not only five "
      "centuries, but also the leap into electronic typesetting, remaining "
      "essentially unchanged. It was popularised in the 1960s with the release "
      "of Letraset sheets containing Lorem Ipsum passages, and more recently "
      "with desktop publishing software like Aldus PageMaker including versions "
      "of Lorem Ipsum.";

  static List<Food> foodItems = [
    Food(
      1,
      AppAsset.sushi1,
      "Sushi1",
      10.0,
      1,
      false,
      dummyText,
      5.0,
      FoodType.sushi,
      150,
        false
    ),
    Food(
      2,
      AppAsset.sushi2,
      "Sushi2",
      15.0,
      1,
      false,
      dummyText,
      3.5,
      FoodType.sushi,
      652,
        false
    ),
    Food(
      3,
      AppAsset.sushi3,
      "Sushi3",
      20.0,
      1,
      false,
      dummyText,
      4.0,
      FoodType.sushi,
      723,
        false
    ),
    Food(
      4,
      AppAsset.sushi4,
      "Sushi4",
      40.0,
      1,
      false,
      dummyText,
      2.5,
      FoodType.kebab,
      456,
        false
    ),
    Food(
      5,
      AppAsset.sushi5,
      "Sushi5",
      10.0,
      1,
      false,
      dummyText,
      4.5,
      FoodType.kebab,
      650,
        false
    ),
    Food(
      6,
      AppAsset.sushi6,
      "Sushi6",
      20.0,
      1,
      false,
      dummyText,
      1.5,
      FoodType.burger,
      350,
        false
    ),
    Food(
      7,
      AppAsset.sushi7,
      "Sushi7",
      12.0,
      1,
      false,
      dummyText,
      3.5,
      FoodType.burger,
      265,
        false
    ),
    Food(
      8,
      AppAsset.sushi8,
      "Sushi8",
      30.0,
      1,
      false,
      dummyText,
      4.0,
      FoodType.ramen,
      890,
        false
    ),
    Food(
      9,
      AppAsset.sushi9,
      "Sushi9",
      10.0,
      1,
      false,
      dummyText,
      5.0,
      FoodType.ramen,
      900,
        false
    ),
    Food(
      10,
      AppAsset.sushi10,
      "Sushi10",
      15.0,
      1,
      false,
      dummyText,
      3.5,
      FoodType.ramen,
      420,
        false
    ),
    Food(
      11,
      AppAsset.sushi11,
      "Sushi11",
      25.0,
      1,
      false,
      dummyText,
      3.0,
      FoodType.tempura,
      263,
        false
    ),
    Food(
      12,
      AppAsset.sushi12,
      "Sushi12",
      20.0,
      1,
      false,
      dummyText,
      5.0,
      FoodType.tempura,
      560,
        false
    ),
  ];

  static List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(
      const Icon(Icons.home_outlined),
      const Icon(Icons.home),
      'Home',
      isSelected: true,
    ),
    BottomNavigationItem(
      const Icon(Icons.shopping_cart_outlined),
      const Icon(Icons.shopping_cart),
      'Shopping cart',
    ),
    BottomNavigationItem(
      const Icon(AppIcon.outlinedHeart),
      const Icon(AppIcon.heart),
      'Favorite',
    ),
    BottomNavigationItem(
      const Icon(Icons.person_outline),
      const Icon(Icons.person),
      'Profile',
    )
  ];

  static List<FoodCategory> categories = [
    FoodCategory(FoodType.all, true),
    FoodCategory(FoodType.sushi, false),
    FoodCategory(FoodType.kebab, false),
    FoodCategory(FoodType.tempura, false),
    FoodCategory(FoodType.ramen, false),
    FoodCategory(FoodType.burger, false),
  ];


  static List<Food> cartItems = [
    Food(
      10,
      AppAsset.sushi10,
      "Sushi10",
      15.0,
      2,
      false,
      dummyText,
      3.5,
      FoodType.ramen,
      420,
        false
    ),
    Food(
      11,
      AppAsset.sushi11,
      "Sushi11",
      25.0,
      4,
      false,
      dummyText,
      3.0,
      FoodType.tempura,
      263,
        false
    ),
    Food(
      12,
      AppAsset.sushi12,
      "Sushi12",
      20.0,
      5,
      false,
      dummyText,
      5.0,
      FoodType.tempura,
      560,
        false
    ),
  ];


  static List<Food> favoriteItems = [
    Food(
      5,
      AppAsset.sushi5,
      "Sushi5",
      10.0,
      1,
      true,
      dummyText,
      4.5,
      FoodType.kebab,
      650,
        false
    ),
    Food(
      6,
      AppAsset.sushi6,
      "Sushi6",
      20.0,
      1,
      true,
      dummyText,
      1.5,
      FoodType.burger,
      350,
        false
    ),
    Food(
      7,
      AppAsset.sushi7,
      "Sushi7",
      12.0,
      1,
      true,
      dummyText,
      3.5,
      FoodType.burger,
      265,
        false
    ),
    Food(
      8,
      AppAsset.sushi8,
      "Sushi8",
      30.0,
      1,
      true,
      dummyText,
      4.0,
      FoodType.ramen,
      890,
        false
    ),
  ];


  static Food food = Food(
    12,
    AppAsset.sushi12,
    "Sushi12",
    20.0,
    1,
    false,
    dummyText,
    5.0,
    FoodType.tempura,
    560,
    false
  );
}




