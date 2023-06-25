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

  int selectedFood = 0;

  List<int> cartIds = [];
  List<int> favoriteIds = [];

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

  Future<void> onFoodTap(int id) async{
    selectedFood = id;
  }

  Future<void> onAddToCartTap(int id, int amount) async {
    if(!cartIds.contains(id)) cartIds.add(id);
    foods[id]?.quantity = amount;
  }

  String calculatePrice(Food food){
    double price = 0;
    price = food.quantity * food.price;
    return price.toString();
  }

  double calculateSubtotal(){
    double subtotal = 0;
    for(var id in cartIds){
      final food = foodById(id);
      subtotal += food.quantity * food.price;
    }
    return subtotal;
  }

  Future<void> onIncrementTap(int id) async{
    final food = foodById(id);
    food.quantity++;
  }

  Future<void> onDecrementTap(int id) async{
    final food = foodById(id);
    if(food.quantity == 1) return;
    food.quantity--;
  }

  Future<void> onDeleteFromCart(int id) async {
    cartIds.remove(id);
    final food = foodById(id);
    food.quantity = 1;
  }

  Future<void> onCleanCart() async {
    for(var id in cartIds){
      final food = foodById(id);
      food.quantity = 1;
    }
    cartIds = [];
  }

  Future<void> onDeleteAddFavorite(int id) async {
    if(favoriteIds.contains(id)) {favoriteIds.remove(id);} else {favoriteIds.add(id);}
    final food = foodById(id);
    food.isFavorite = !food.isFavorite;
  }
}
