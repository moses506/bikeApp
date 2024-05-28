import 'dart:async';

import 'package:app_repo/app_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this.repo) : super(const ThemeState()) {
    _themeSubscription = repo.theme.listen((mode) {
      final theme = ThemeMode.values[mode];
      var desc = 'System Default';
      var icon = Icons.brightness_auto_outlined;
      switch (theme) {
        case ThemeMode.system:
          desc = 'System Default';
          icon = Icons.brightness_auto_outlined;
          break;
        case ThemeMode.light:
          desc = 'Light Mode';
          icon = Icons.light_mode_outlined;
          break;
        case ThemeMode.dark:
          desc = 'Dark Mode';
          icon = Icons.dark_mode_outlined;
          break;
      }
      emit(state.copyWith(mode: theme, description: desc, icon: icon));
    });
  }

  final AppRepo repo;

  late StreamSubscription<int> _themeSubscription;

  @override
  Future<void> close() {
    _themeSubscription.cancel();
    return super.close();
  }

  Future<void> setTheme(ThemeMode theme) async => repo.setTheme(theme.index);
}
