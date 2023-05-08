import '../data/app_data.dart';
import '../data/models/food.dart';
import '../data/models/food_category.dart';

class FoodState {
  FoodState._();
  static final _instance = FoodState._();
  factory FoodState() => _instance;
  int _currentIndex = 0; //Индекс табнавигации.
  int get currentIndex => _currentIndex;
  int selectedFoodId = 0;
  List<int> cartIds = [];
  final List<FoodCategory> _categories = AppData.categories;
  List<FoodCategory> get categories => _categories;

  int _selectedCategoryIndex = 0;
  int get selectedCategoryIndex => _selectedCategoryIndex;

  Future<void> onCategoryTap(int selectedIndex) async {
    if (_selectedCategoryIndex == selectedIndex) return;
    //Меняем выбранную категорию
    _selectedCategoryIndex = selectedIndex;
    _categories.asMap().forEach((index, category) {
      category.isSelected = index == selectedIndex;
    });
    if (_selectedCategoryIndex == 0) {
      foodIdsByCategory = foodIds;
    } else {
      foodIdsByCategory = foods.entries
          .where((foodEntry) => (foodEntry.value.type ==
          _categories[_selectedCategoryIndex].type))
          .expand((foodEntry) => [foodEntry.value.id])
          .toList();
    }
  }

  Future<void> onTabTap(int index) async {
    if (_currentIndex == index) return;
    _currentIndex = index;
  }

  Future<void> onFoodTap(int id) async {
    selectedFoodId = id;
  }

  Future<void> onAddToCartTap(int id, int amount) async {
    if (!cartIds.contains(id)) cartIds.add(id);
    foods[id]?.quantity = amount;
  }

  String calculatePricePerEachItem(Food food) {
    double price = 0;
    price = food.quantity * food.price;
    return price.toString();
  }

  double calculateSubtotalPrice() {
    double subtotal = 0;
    for (var id in cartIds) {
      final food = foodById(id);
      subtotal += food.quantity * food.price;
    }
    return subtotal;
  }
  Future<void> onIncrementTap(int id) async {
    final food = foodById(id);
    food.quantity = food.quantity + 1;
  }
  Future<void> onDecrementTap(int id) async {
    final food = foodById(id);
    if (food.quantity == 1) return;
    food.quantity = food.quantity - 1;
  }
  Future<void> onDeleteFoodFromCartById(int id) async {
    cartIds.remove(id);
    final food = foodById(id);
    food.quantity = 1;
  }
  Future<void> onCleanCart() async {
    for (var id in cartIds) {
      final food = foodById(id);
      food.quantity = 1;
    }
    cartIds = [];
  }
  Future<void> onAddDeleteFavoriteTap(int id) async {
    if (favoriteIds.contains(id)) {favoriteIds.remove(id);} else { favoriteIds.add(id);}
    final food = foodById(id);
    food.isFavorite = !food.isFavorite;
  }


  Map<int, Food> foods =
  Map.fromEntries(AppData.foodItems.map((food) => MapEntry(food.id, food)));
  List<int> foodIds = AppData.foodItems.expand((food) => [food.id]).toList();
  List<int> foodIdsByCategory =
  AppData.foodItems.expand((food) => [food.id]).toList();
  List<int> favoriteIds = [];


  Food foodById(int id) {
    return foods[id] ?? AppData.foodItems[0];
  }
}