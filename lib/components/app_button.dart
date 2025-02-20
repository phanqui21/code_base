import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/padding_constants.dart';
import '../core/enums/button_type.dart';
import '../core/helpers/theme_helper.dart';



class AppButton extends StatelessWidget {
  static final REdgeInsets _defaultPadding = PaddingConstants.h20v10R;
  static final double _defaultHeight = 48.h;
  final ButtonType type;
  final String title;
  final VoidCallback onPressed;
  final double? borderRadius;
  final REdgeInsets? padding;
  final Widget? prefix;
  final Widget? suffix;
  final MainAxisSize mainAxisSize;
  final double? height;
  final TextStyle? textStyle;
  final Color? outlineColor;
  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.borderRadius,
    this.padding,
    this.prefix,
    this.suffix,
    this.mainAxisSize = MainAxisSize.min,
    this.height,
    this.textStyle,
    this.outlineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? _defaultHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: type.getBackgroundColor(context),
          shadowColor: Colors.transparent,
          padding: padding ?? _defaultPadding,
          foregroundColor: type.getForegroundColor(context),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            side: type == ButtonType.outline
                ? BorderSide(
                    color: outlineColor ??
                        ThemeHelper.borderColorOutlineButton(context),
                  )
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefix != null) ...[
              prefix!,
              8.horizontalSpace,
            ],
            Text(
              title,
              style: textStyle ??
                  TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: type.getTextColor(context),
                  ),
            ),
            if (suffix != null) ...[
              8.horizontalSpace,
              suffix!,
            ],
          ],
        ),
      ),
    );
  }
}
