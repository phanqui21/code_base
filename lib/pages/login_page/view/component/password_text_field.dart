
import 'package:flutter/widgets.dart';

import '../../../../components/app_text_form_field.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChange;
  final String? Function(String?)? validate;
  final void Function(String)? onSubmit;
  final String? errorText;
  final bool isValidate;
  final String hint;
  final String label;

  const PasswordTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    this.onChange,
    this.validate,
    this.onSubmit,
    this.errorText,
    this.isValidate = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      validate: validate ??
          (passwordValue) {
            if (passwordValue?.isEmpty ?? true) {
              return "Please enter the password";
            }
            return null;
          },
      obscureText: true,
      controller: controller,
      onChange: onChange,
      label: label,
      onSubmit: onSubmit,
      hint: hint,
    );
  }
}
