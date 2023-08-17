part of 'logic_bloc.dart';

@immutable
abstract class LogicEvent {}

class TabTap extends LogicEvent {
  final int index;

  TabTap(this.index);
}