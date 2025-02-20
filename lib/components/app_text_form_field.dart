import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/padding_constants.dart';
import '../core/constants/spacing_constants.dart';
import '../core/helpers/theme_helper.dart';



class AppTextFormField extends StatefulWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final void Function(String)? onChange;
  final String? label;
  final String? hint;
  final int? maxLength;
  final List<TextInputFormatter>? formatters;
  final bool enabled;
  final InputBorder? border;
  final InputBorder? borderFocus;
  final InputBorder? borderError;
  final InputBorder? borderFocusedError;
  final bool obscureText;
  final Widget? suffix;
  final VoidCallback? onTap;
  final bool suffixChangeByValidate;
  final Widget? prefixIcon;
  final double? radius;
  final bool isCorrect;
  final bool haveOnChange;
  final int? minLines;
  final int? maxLines;
  final bool? filled;
  final Color? filledColor;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final bool? readOnly;
  final String? initialValue;
  final void Function(String)? onSubmit;

  const AppTextFormField({
    Key? key,
    this.keyboardType,
    this.controller,
    this.label,
    this.maxLength,
    this.formatters,
    this.hint,
    this.enabled = true,
    this.border,
    this.obscureText = false,
    this.validate,
    this.onChange,
    this.suffix,
    this.onTap,
    this.suffixChangeByValidate = false,
    this.prefixIcon,
    this.radius,
    this.isCorrect = false,
    this.haveOnChange = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.borderFocus,
    this.borderFocusedError,
    this.borderError,
    this.filled = true,
    this.filledColor,
    this.labelStyle,
    this.style,
    this.hintStyle,
    this.readOnly,
    this.onSubmit,
    this.initialValue,
  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _obscureText = false;
  bool? _validate;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label?.isNotEmpty ?? false) ...[
          Text(
            (widget.label ?? ''),
            style: widget.labelStyle ??
                TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: ThemeHelper.textColorDefault(context),
                ),
          ),
          6.verticalSpace,
        ],
        TextFormField(
          initialValue: widget.initialValue,
          onTap: widget.onTap,
          readOnly: widget.readOnly ?? false,
          obscureText: _obscureText,
          controller: widget.controller,
          maxLength: widget.maxLength,
          inputFormatters: widget.formatters,
          enabled: widget.enabled,
          keyboardType: widget.keyboardType,
          onFieldSubmitted: widget.onSubmit,
          style: widget.style ??
              TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: ThemeHelper.textColorContentTextField(context),
              ),
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            errorStyle: kIsWeb
                ? const TextStyle(
                    fontSize: 13.3,
                  )
                : null,
            filled: widget.filled,
            fillColor: widget.filledColor ?? ThemeHelper.white(context),
            enabledBorder: widget.border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 30.r),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
            focusedBorder: widget.borderFocus ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 30.r),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
            focusedErrorBorder: widget.borderFocusedError ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 30.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
            errorBorder: widget.borderError ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 30.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
            isDense: true,
            contentPadding: REdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 18,
              right: widget.suffix != null || widget.obscureText ? 0 : 18,
            ),
            prefix: kIsWeb ? SpacingConstants.w20 : null,
            errorMaxLines: 2,
            counterText: '',
            suffixIcon: _buildSuffix() == null
                ? null
                : Padding(
                    padding: PaddingConstants.h16,
                    child: _buildSuffix()!,
                  ),
            suffixIconConstraints: BoxConstraints.tightFor(height: 20.h),
            prefixIcon: widget.prefixIcon == null
                ? null
                : Padding(
                    padding: PaddingConstants.h16,
                    child: widget.prefixIcon!,
                  ),
            prefixIconConstraints: BoxConstraints.tightFor(height: 20.h),
            hintText: widget.hint,
            hintStyle: widget.hintStyle ??
                TextStyle(
                  fontSize: 15.sp,
                  color: ThemeHelper.textColorHintTextField(context),
                ),
          ),
          onChanged: (value) {
            widget.onChange?.call(value);
            _validate = widget.isCorrect;
          },
          validator: (value) {
            final result = widget.validate?.call(value);
            final isValid = result == null;
            final isChanged = _validate != isValid;

            _validate = isValid;

            if (isChanged && widget.suffixChangeByValidate) {
              setState(() {});
            }
            return result;
          },
        ),
      ],
    );
  }

  Widget? _buildSuffix() {
    return widget.suffixChangeByValidate && _validate != null
        ? _buildSuffixByValidate()
        : widget.suffix ?? (widget.obscureText ? _buildObscure() : null);
  }

  Widget _buildSuffixByValidate() {
    return SizedBox(
      height: 14.r,
      width: 16.r,
      child: Center(
        child: widget.haveOnChange
            ? Icon(
                widget.isCorrect ? Icons.done : Icons.close,
              )
            : Icon(
                _validate ?? false ? Icons.done : Icons.close,
              ),
      ),
    );
  }

  Widget _buildObscure() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      child: SizedBox(
        height: 20.r,
        width: 20.r,
        child: Center(
          child: Icon(
            size: 20.r,
            color: ThemeHelper.buttonColorPrimary(context),
            !_obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}
