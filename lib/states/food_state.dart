class FoodState {
  FoodState._();
  static final _instance = FoodState._();
  factory FoodState() => _instance;
  int _currentIndex = 0; //Индекс табнавигации.
  int get currentIndex => _currentIndex;

  Future<void> onTabTap(int index) async {
    if (_currentIndex == index) return;
    _currentIndex = index;
  }


}
