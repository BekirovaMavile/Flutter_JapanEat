import 'package:flutter/material.dart';
import 'package:flutter_japan_eat/ui_kit/app_theme.dart';

class ThemeState {
  final ThemeData theme;

  const ThemeState({required this.theme});

  ThemeState copyWith({ThemeData? theme}) {
    return ThemeState(theme: theme ?? this.theme);
  }

  factory ThemeState.initial() {
    return ThemeState(theme: AppTheme.lightTheme!);
  }
}
