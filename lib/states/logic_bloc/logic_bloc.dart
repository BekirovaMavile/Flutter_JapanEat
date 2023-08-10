import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'logic_event.dart';
part 'logic_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {

  FoodBloc() : super(FoodState(0)) {
    on<TabTap>(_onTabTap);
  }

  void _onTabTap(TabTap event, Emitter<FoodState> emit) async {
    int index = event.index;
      if (state.currentIndex == index) return;
      emit(FoodState(index));
  }
}
