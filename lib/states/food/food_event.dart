part of 'food_bloc.dart';

@immutable
abstract class FoodEvent {
  final Food food;

  const FoodEvent(this.food);

  @override
  List<Object?> get props => [food];
}

class IncreaseQuantityEvent extends FoodEvent {
  const IncreaseQuantityEvent(Food food) : super(food);
}

class DecreaseQuantityEvent extends FoodEvent {
  const DecreaseQuantityEvent(Food food) : super(food);
}

class AddToCartEvent extends FoodEvent {
  const AddToCartEvent(Food food) : super(food);
}

class DeleteFromCartEvent extends FoodEvent {
  const DeleteFromCartEvent(Food food) : super(food);
}

class FavoriteListEvent extends FoodEvent {
  const FavoriteListEvent(Food food) : super(food);
}
