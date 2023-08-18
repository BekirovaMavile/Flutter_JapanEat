import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../ui_kit/_ui_kit.dart';
// import 'package:flutter_japan_eat/ui_kit/_ui_kit';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ThemeEvent>(_switchTheme);
  }

  void _switchTheme(ThemeEvent event, Emitter<ThemeState> emit) {
    if (state.theme == AppTheme.lightTheme) {
      emit(state.copyWith(theme: AppTheme.darkTheme!));
    } else {
      emit(state.copyWith(theme: AppTheme.lightTheme!));
    }
  }

  bool get isLightTheme =>
      state.theme == AppTheme.lightTheme ? true : false;
}
