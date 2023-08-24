import 'package:flutter/cupertino.dart';
import 'package:flutter_japan_eat/states/theme/theme_state.dart';
import 'package:flutter_japan_eat/ui_kit/app_theme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeState _state;

  ThemeState get state => _state;

  ThemeProvider() : _state = ThemeState.initial();

  switchTheme() {
    if (_state.theme == AppTheme.lightTheme) {
      _state = _state.copyWith(theme: AppTheme.darkTheme!);
    } else {
      _state = _state.copyWith(theme: AppTheme.lightTheme!);
    }
    notifyListeners();
  }
}