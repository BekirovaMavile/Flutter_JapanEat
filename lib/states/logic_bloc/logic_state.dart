part of 'logic_bloc.dart';
@immutable
class FoodState {
  final int currentIndex;

  FoodState(this.currentIndex);
}

class FoodInitial extends FoodState {
  FoodInitial(super.currentIndex);
}
