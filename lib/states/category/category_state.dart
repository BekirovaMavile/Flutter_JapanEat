part of 'category_bloc.dart';

@immutable
class CategoryState {
  final List<FoodCategory> foodCategories;
  final List<Food> foods;

  const CategoryState.initial(
    List<Food> foods,
    List<FoodCategory> foodCategories,
  ) : this(foods: foods, foodCategories: foodCategories);

  const CategoryState({required this.foodCategories, required this.foods});

  @override
  List<Object?> get props => [foodCategories, foods];

  CategoryState copyWith({
    List<FoodCategory>? foodCategories,
    List<Food>? foods,
  }) {
    return CategoryState(
      foodCategories: foodCategories ?? this.foodCategories,
      foods: foods ?? this.foods,
    );
  }
}
