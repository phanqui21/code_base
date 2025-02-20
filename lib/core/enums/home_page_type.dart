import 'package:easy_localization/easy_localization.dart';

import '../resource/app_images.dart';
import '../translations/locale_keys.g.dart';

enum HomePageType {
  home,
  document,
  targets,
  report,
}

extension HomePageTypeExtension on HomePageType {
  String get title {
    switch (this) {
      case HomePageType.home:
        return LocaleKeys.home_homePage.tr();
      case HomePageType.document:
        return LocaleKeys.home_document.tr();
      case HomePageType.targets:
        return LocaleKeys.home_target.tr();
      case HomePageType.report:
        return LocaleKeys.home_report.tr();
    }
  }

  String get selectedIcon {
    switch (this) {
      case HomePageType.home:
        return AppImages.selectedHome;
      case HomePageType.document:
        return AppImages.selectedMedia;
      case HomePageType.targets:
        return AppImages.selectedIntroduceNews;
      case HomePageType.report:
        return AppImages.selectedReport;
    }
  }

  String get unselectedIcon {
    switch (this) {
      case HomePageType.home:
        return AppImages.unselectedHome;
      case HomePageType.document:
        return AppImages.unselectedMedia;
      case HomePageType.targets:
        return AppImages.unSelectedIntroduceNews;
      case HomePageType.report:
        return AppImages.unselectedReport;
    }
  }
}
