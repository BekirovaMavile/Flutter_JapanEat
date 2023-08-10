part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {
  FoodCategory get category;
}

class CategoryTap extends CategoryEvent{
  final FoodCategory category;

  @override
  List<Object?> get props => [category];

  CategoryTap({required this.category});
}

