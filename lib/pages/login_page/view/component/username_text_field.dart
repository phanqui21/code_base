import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../../../components/app_text_form_field.dart';

class UsernameTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChange;
  final String? Function(String?)? validate;
  final void Function(String)? onSubmit;
  final String hint;
  final String label;

  const UsernameTextField({
    super.key,
    required this.controller,
    this.onChange,
    this.validate,
    required this.hint,
    required this.label,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      validate: validate ??
          (value) {
            final isValid = (value?.isEmpty ?? true);
            if (isValid) {
              return 'Please fill out all the fields';
            }
            return null;
          },
      controller: controller,
      onChange: onChange,
      hint: hint,
      label: kIsWeb ? label : null,
      onSubmit: onSubmit,
    );
  }
}
