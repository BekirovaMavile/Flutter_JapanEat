import '../../data/app_data.dart';
import '../data/models/food.dart';
class FoodState {
  FoodState._();
  static final _instance = FoodState._();
  factory FoodState() => _instance;

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  int _categoryIndex = 0;
  int get currentIndex => _categoryIndex;

  var categories = AppData.categories;

  Map<int, Food> foods = Map.fromEntries(AppData.foodItems.map((food) => MapEntry(food.id, food)));
  List<int> foodIds = AppData.foodItems.expand((food) => [food.id]).toList();
  late List<int> foodIdsByCategory = foodIds;



  Future<void> onTabTap (int index) async {
    if(_tabIndex != index){
      _tabIndex = index;
    }
  }

  Future<void> categoryTab (int index) async{
    if(currentIndex == index) return;
    for (int i = 0; i < categories.length; i++){
      categories[i].isSelected = i == index;
    }
    _categoryIndex = index;
    if(_categoryIndex == 0){
      foodIdsByCategory = foodIds;
    } else {
      var tmp = <int>[];
      foods.forEach((id, food) {
        if(food.type == categories[currentIndex].type){
          tmp.add(id);
        }
      }
      );
      foodIdsByCategory = tmp;
    }
    print(foodIdsByCategory);
  }
  Food foodById (int id){
    return foods[id] ?? AppData.foodItems[0];
  }
}
