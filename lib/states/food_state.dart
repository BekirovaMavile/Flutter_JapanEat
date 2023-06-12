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

  // Map<FoodType, Food> foods = Map.fromEntries(AppData.foodItems.map((food) => MapEntry(food.type, food)));
  List<FoodType> foodType = AppData.foodItems.expand((food) => [food.type]).toList();
  List<FoodType> foodTypeByCategory = AppData.foodItems.expand((food) => [food.type]).toList();

  Map<FoodType, List<Food>> foodsByType = {};

  Future<void> init() async{
    for (Food food in AppData.foodItems) {
      if (foodsByType.containsKey(food.type) && foodsByType[food.type] != null) {
        foodsByType[food.type]!.add(food);
      } else {
        foodsByType[food.type] = [food];
      }
    }


    // FoodType selectedCategory = FoodType.sushi;
    // List<Food>? selectedFoods = foodsByType[selectedCategory];
    //
    // if (selectedFoods != null) {
    //
    //   for (Food food in selectedFoods) {
    //     print(food.name);
    //   }
    // }
  }


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
  // Food foodByType(FoodType foodType) {
  //   return foods[foodType] ?? AppData.foodItems[0];
  // }
  Food? foodByType(FoodType type) {
    final foodList = foodsByType[type];
    return foodList != null && foodList.isNotEmpty ? foodList[0] : null;
  }


  // Food foodByType(FoodType foodType) {
  //   List<Food>? foods = FoodState().foodsByType[foodType];
  //   return foods != null && foods.isNotEmpty ? foods[0] : AppData.foodItems[0];
  // }




// Food foodByType(FoodType type) {
//   // for (Food food in FoodType) {
//     if (foods[type] == foodType) {
//       return foods;
//     }
//   // }
//   return AppData.foodItems[0];
// }

}