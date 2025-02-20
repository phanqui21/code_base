import 'dart:ui';

import '../local_storage/session_manager.dart';

class LocalizationUtil {
  static const List<Locale> supportedLocales = <Locale>[
    Locale('vi'),
    Locale('en'),
  ];
  static const Locale defaultLocale = Locale('vi');
}
