part of 'logic_bloc.dart';

@immutable
abstract class FoodEvent {}

class TabTap extends FoodEvent {
  final int index;

  TabTap(this.index);
}