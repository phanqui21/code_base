import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/theme/theme_bloc.dart';

class ThemeHelper {
  static Color black(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode ? _DarkTheme.black : _LightTheme.black;
  }

  static Color white(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode ? _DarkTheme.black : _LightTheme.white;
  }

  static Color buttonColorPrimary(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.buttonColorPrimary
        : _LightTheme.buttonColorPrimary;
  }

  static Color textColorDefault(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.textColorDefault
        : _LightTheme.textColorDefault;
  }

  static Color textColorContentTextField(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.textColorDefault
        : _LightTheme.textColorContentTextField;
  }

  static Color textColorHintTextField(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.textColorHintTextField
        : _LightTheme.textColorHintTextField;
  }

  static Color borderColorOutlineButton(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.borderColorOutlineButton
        : _LightTheme.borderColorOutlineButton;
  }

  static Color buttonColorSecondary(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.buttonColorSecondary
        : _LightTheme.buttonColorSecondary;
  }

  static Color buttonColorNormal(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.buttonColorNormal
        : _LightTheme.buttonColorNormal;
  }

  static Color textColorPrimaryButton(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.textColorPrimaryButton
        : _LightTheme.textColorPrimaryButton;
  }

  static Color textColorNormalButton(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode ? _DarkTheme.textColorDefault : _LightTheme.black;
  }

  static Color textColorTitle(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.textColorDefault
        : _LightTheme.textColorTitle;
  }

  static Color borderColorActiveTextField(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.borderColorActiveTextField
        : _LightTheme.borderColorActiveTextField;
  }

  static Color textColorDefaultTab(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.textColorDefaultTab
        : _LightTheme.textColorDefaultTab;
  }

  static Color backgroundRealm(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.backgroundRealm
        : _LightTheme.backgroundRealm;
  }

  static Color iconColorGray(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.textColorDefault
        : _LightTheme.iconColorGray;
  }

  static Color textFilterColorGray(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.textFilterColorGray
        : _LightTheme.black;
  }

  static Color textPlaceHolder(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.textPlaceHolder
        : _LightTheme.textPlaceHolder;
  }

  static Color textPrimary(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode ? _DarkTheme.textPrimary : _LightTheme.textPrimary;
  }

  static Color textSecond(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode ? _DarkTheme.textSecond : _LightTheme.textSecond;
  }

  static Color textHighlight(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.textHighlight
        : _LightTheme.textHighlight;
  }

  static Color borderLine(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode ? _DarkTheme.borderLine : _LightTheme.borderLine;
  }

  static Color iconThemeDataColor(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.iconThemeDataColor
        : _LightTheme.iconThemeDataColor;
  }

  static Color textColorLink(BuildContext context) {
    return context.read<ThemeBloc>().isDarkMode
        ? _DarkTheme.textColorLink
        : _LightTheme.textColorLink;
  }
}

class _LightTheme {
  static const Color textColorContentTextField = Color(0xFF071021);
  static const Color textColorLink = Color(0xFF4F91B2);
  static const Color black = Colors.black;
  static const Color white = Color(0xFFf4f4f4);
  static const Color buttonColorPrimary = Color(0xFF00428C);
  static const Color textColorDefault = Color(0xFF152C44);
  static const Color textColorHintTextField = Color(0xFF848484);
  static const Color borderColorOutlineButton = Color(0xFFD9D9D9);
  static const Color buttonColorSecondary = Color(0xFFF1514F);
  static const Color buttonColorNormal = Color(0xFFEBEBEB);
  static const Color textColorPrimaryButton = Colors.white;
  static const Color textColorTitle = Color(0xFF1D1D1D);
  static const Color borderColorActiveTextField = Color(0xFF00428C);
  static const Color textColorDefaultTab = Color(0xFF909090);
  static const Color backgroundRealm = Color(0xFFFFFFFF);
  static const Color iconColorGray = Color(0xFF6e6b7b);
  static const Color textPlaceHolder = Color(0xFF707070);
  static const Color textPrimary = Color(0xFF071021);
  static const Color textSecond = Color(0xFF000000);
  static const Color textHighlight = Color(0xFF00529C);
  static const Color borderLine = Color(0xFFDBDBDB);
  static const Color iconThemeDataColor = Color(0xFF555555);
}

class _DarkTheme {
  static const Color textColorDefault = Color(0xFFFFFFFF);
  static const Color textColorLink = Color(0xFF4F91B2);
  static const Color buttonColorPrimary = Color(0xFF00428C);
  static const Color black = Color(0xFF030d1c);
  static const Color textColorHintTextField = Color(0xFF848484);
  static const Color borderColorOutlineButton = Color(0xFFD9D9D9);
  static const Color buttonColorSecondary = Color(0xFFF1514F);
  static const Color buttonColorNormal = Color(0xFFEBEBEB);
  static const Color textColorPrimaryButton = Colors.white;
  static const Color borderColorActiveTextField = Color(0xFF00428C);
  static const Color textColorDefaultTab = Color(0xFF909090);
  static const Color backgroundRealm = Color(0xFF122230);
  static const Color textFilterColorGray = Color(0xFFafb6c1);
  static const Color textPlaceHolder = Color(0xFF707070);
  static const Color textPrimary = Color(0xFF071021);
  static const Color textSecond = Color(0xFF000000);
  static const Color textHighlight = Color(0xFF00529C);
  static const Color borderLine = Color(0xFFDBDBDB);
  static const Color iconThemeDataColor = Color(0xFF555555);
}
