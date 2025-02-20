import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/session/session_bloc.dart';
import '../../bloc/tab_bloc/tab_bloc.dart';
import '../../bloc/theme/theme_bloc.dart';
import '../../config/app_router.dart';
import '../../config/build_config.dart';
import '../../config/routes/common_route_guard.dart';
import '../../pages/splash_page/bloc/splash_bloc.dart';
import '../../repositories/authentication_repository.dart';
import '../enums/app_environment.dart';
import '../helpers/dialog_helper.dart';
import '../helpers/event_bus.dart';
import '../local_storage/secure_storage.dart';
import '../local_storage/shared_prefs.dart';
import '../network/dio_client.dart';
import '../network/raw_dio_client.dart';

final GetIt getIt = GetIt.instance;

Future<void> registerCommonDependencies() async {
  getIt.registerSingletonAsync(() => SharedPrefs().init());
  getIt.registerSingleton<SecureStorage>(SecureStorage());
  getIt.registerSingleton<EventBus>(EventBus());
}

Future<void> registerDependencies(AppEnvironment environment) async {
  // Add inject dependency
  getIt.registerSingleton(BuildConfig(environment));
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(
    getIt<Dio>(),
    getIt<BuildConfig>(),
  ));
  getIt.registerSingleton(RawDioClient(
    getIt<Dio>(),
    getIt<BuildConfig>(),
  ));
  getIt.registerLazySingleton<DialogHelper>(() => DialogHelperImpl());
  getIt.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());
  getIt.registerSingleton<CommonRouteGuard>(CommonRouteGuard());
  getIt.registerSingleton<AppRouter>(
    AppRouter(
      getIt<GlobalKey<NavigatorState>>(),
    ),
  );
  _registerRepositories();
  _registerBlocs();
}

void _registerRepositories() {
  getIt.registerLazySingleton<IAuthenticationRepository>(
    () => AuthenticationRepositoryImpl(getIt<DioClient>(), getIt<BuildConfig>()),
  );
}

void _registerBlocs() {
  getIt.registerFactory(
    () => ThemeBloc(),
  );
  getIt.registerFactory(
    () => SplashBloc(),
  );

  getIt.registerFactory(
    () => SessionBloc(),
  );

  getIt.registerFactory(
    () => TabBloc(),
  );
}
