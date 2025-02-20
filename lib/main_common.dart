import 'dart:async';

import 'package:code_base/pages/splash_page/bloc/splash_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'application.dart';
import 'bloc/theme/theme_bloc.dart';
import 'config/app_router.dart';
import 'core/di/injection.dart';
import 'core/enums/app_environment.dart';
import 'core/utils/localization_util.dart';

void mainCommon(AppEnvironment environment) {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      await getIt.allReady();
      await registerCommonDependencies();
      await registerDependencies(environment);
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<SplashBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<ThemeBloc>(),
            ),
          ],
          child: EasyLocalization(
            supportedLocales: LocalizationUtil.supportedLocales,
            path: 'assets/translations',
            fallbackLocale: LocalizationUtil.defaultLocale,
            startLocale: LocalizationUtil.defaultLocale,
            child: Application(router: getIt<AppRouter>()),
          ),
        ),
      );
    },
    (error, stack) {},
  );
}
