import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/duration_constants.dart';

abstract class DialogHelper {
  void snackBar(
    BuildContext context, {
    required String content,
    Duration duration = DurationConstants.s4,
  });
}

class DialogHelperImpl implements DialogHelper {
  final _fToast = FToast();

  @override
  void snackBar(
    BuildContext context, {
    required String content,
    Duration duration = DurationConstants.s4,
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: duration,
      ),
    );
  }
}
