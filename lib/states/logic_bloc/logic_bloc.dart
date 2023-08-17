import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'logic_event.dart';
part 'logic_state.dart';

class LogicBloc extends Bloc<LogicEvent, LogicState> {

  LogicBloc() : super(LogicState(0)) {
    on<TabTap>(_onTabTap);
  }

  void _onTabTap(TabTap event, Emitter<LogicState> emit) async {
    int index = event.index;
      if (state.currentIndex == index) return;
      emit(LogicState(index));
  }
}
