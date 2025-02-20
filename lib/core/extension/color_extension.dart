import 'dart:ui';

extension ColorExtension on Color {
  ColorFilter get toSvgColor => ColorFilter.mode(this, BlendMode.srcIn);
}
