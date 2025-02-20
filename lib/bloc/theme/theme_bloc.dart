import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../core/local_storage/session_manager.dart';
import 'theme_state.dart';

class ThemeBloc extends Cubit<ThemeState> {
  ThemeBloc() : super(InitializeModeState()) {
    changeDarkMode(SessionManager.instance.isDarkMode ?? false);
  }

  bool get isDarkMode => SessionManager.instance.isDarkMode ?? false;

  Future<void> changeDarkMode(bool value) async {
    await SessionManager.instance.setIsDarkMode(value);
    await SessionManager.instance.setCacheThemeModeName(
      value ? ThemeMode.dark.name : ThemeMode.light.name,
    );
    emit(ChangeDarkModeState(value));
  }
}
