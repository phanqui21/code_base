import 'package:flutter/material.dart';

import '../helpers/theme_helper.dart';

enum ButtonType { primary, secondary, normal, outline }

extension ButtonTypeExtension on ButtonType {
  Color getBackgroundColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
        return ThemeHelper.buttonColorPrimary(context);
      case ButtonType.secondary:
        return ThemeHelper.buttonColorSecondary(context);
      case ButtonType.normal:
        return ThemeHelper.buttonColorNormal(context);
      case ButtonType.outline:
        return Colors.transparent;
    }
  }

  Color? getForegroundColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
      case ButtonType.secondary:
      case ButtonType.normal:
        return null;
      case ButtonType.outline:
        return Colors.grey;
    }
  }

  Color getTextColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
      case ButtonType.secondary:
        return ThemeHelper.textColorPrimaryButton(context);
      case ButtonType.normal:
        return ThemeHelper.textColorNormalButton(context);
      case ButtonType.outline:
        return ThemeHelper.textColorTitle(context);
    }
  }
}
