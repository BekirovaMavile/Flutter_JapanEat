import '../../data/app_data.dart';
import '../data/models/food.dart';
class FoodState {
  FoodState._();
  static final _instance = FoodState._();
  factory FoodState() => _instance;
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  int _currentCategoryIndex = 0;
  int get currentCategoryIndex => _currentCategoryIndex;

  Map<FoodType, Food> foods = Map.fromEntries(AppData.foodItems.map((food) => MapEntry(food.type, food)));
  List<FoodType> foodType = AppData.foodItems.expand((food) => [food.type]).toList();
  List<FoodType> foodTypeByCategory = AppData.foodItems.expand((food) => [food.type]).toList();


  Future<void> tabTap (int index) async {
    if (_tabIndex != index) {
      _tabIndex = index;
    }
  }

  Future<void> categoryTab (int currentIndex) async {
    for (int index = 0; index < AppData.categories.length; index++) {
      AppData.categories[index].isSelected = index == currentIndex;
    }
    if (currentIndex == 0) {
      foodTypeByCategory = foodType;
    } else {
      FoodType selectedCategoryType = AppData.categories[currentIndex].type;
      foodTypeByCategory = foodType.where((foodType) => foodType == selectedCategoryType).toList();
    }
  }

  Food foodByType(FoodType foodType) {
    return foods[foodType] ?? AppData.foodItems[0];
  }

  // Food foodByType(FoodType type) {
  //   // for (Food food in FoodType) {
  //     if (foods[type] == foodType) {
  //       return foods;
  //     }
  //   // }
  //   return AppData.foodItems[0];
  // }

}
