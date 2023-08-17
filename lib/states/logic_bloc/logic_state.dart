part of 'logic_bloc.dart';
@immutable
class LogicState {
  final int currentIndex;

  LogicState(this.currentIndex);
}

class LogicInitial extends LogicState {
  LogicInitial(super.currentIndex);
}
