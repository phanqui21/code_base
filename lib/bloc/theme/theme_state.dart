import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitializeModeState extends ThemeState {}

class ChangeDarkModeState extends ThemeState {
  final bool isDarkMode;

  ChangeDarkModeState(this.isDarkMode);

  @override
  List<Object?> get props => [isDarkMode];
}
