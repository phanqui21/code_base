import 'package:auto_route/auto_route.dart';
import 'package:code_base/config/routes/route_path.dart';
import 'package:flutter/material.dart';

import '../pages/home_page/view/home_page.dart';
import '../pages/splash_page/view/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|View,Route')
class AppRouter extends _$AppRouter {
  AppRouter(
    GlobalKey<NavigatorState> globalKey,
  ) : super(navigatorKey: globalKey);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: RoutePath.splashPage,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: RoutePath.homePage,
        ),
      ];
}
