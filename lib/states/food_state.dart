import '../../data/app_data.dart';
class FoodState {
  FoodState._();
  static final _instance = FoodState._();
  factory FoodState() => _instance;
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  int _currentCategoryIndex = 0;
  int get currentCategoryIndex => _currentCategoryIndex;

  Future<void> tabTap (int index) async {
    if (_tabIndex != index) {
      _tabIndex = index;
    }
  }

  Future<void> categoryTab (int currentIndex) async {
    for (int index = 0; index < AppData.categories.length; index++) {
      AppData.categories[index].isSelected = index == currentIndex;
    }
  }
}
