import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_state.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit() : super(LogicState(0, 0));

  void onTabTap(int index) async {
    if (state.currentIndex == index) return;
    emit(LogicState(index, index)); // Here, update both currentIndex and index
  }
}

