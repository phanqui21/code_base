import 'package:flutter/material.dart';

import '../constants/duration_constants.dart';
import '../di/injection.dart';
import '../helpers/dialog_helper.dart';

mixin DialogMixin<T extends StatefulWidget> on State<T> {
  late final DialogHelper _dialogHelper;

  @override
  void initState() {
    _dialogHelper = getIt<DialogHelper>();
    super.initState();
  }

  void snackBar(
    String content, {
    Duration duration = DurationConstants.s4,
  }) =>
      _dialogHelper.snackBar(
        context,
        content: content,
        duration: duration,
      );
}
