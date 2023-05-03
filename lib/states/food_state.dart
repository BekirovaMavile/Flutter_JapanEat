import '../data/app_data.dart';
import '../data/models/food_category.dart';

class FoodState {
  FoodState._();
  static final _instance = FoodState._();
  factory FoodState() => _instance;
  int _currentIndex = 0; //Индекс табнавигации.
  int get currentIndex => _currentIndex;

  List<FoodCategory> _categories = AppData.categories;
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
  }


}