import 'package:auto_route/auto_route.dart';

import 'package:easy_localization/easy_localization.dart' as localized;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/theme/theme_bloc.dart';
import 'bloc/theme/theme_state.dart';
import 'config/app_router.dart';

var themeMode = ThemeMode.light;

@pragma('vm:entry-point')
class Application extends StatefulWidget {
  final AppRouter router;

  const Application({Key? key, required this.router}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          buildWhen: (previous, current) => previous != current,
          bloc: context.read<ThemeBloc>(),
          builder: (context, state) {
            if (state is ChangeDarkModeState) {
              themeMode = state.isDarkMode ? ThemeMode.dark : ThemeMode.light;
            }
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              themeMode: themeMode,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerDelegate: AutoRouterDelegate(widget.router),
              routeInformationParser: widget.router.defaultRouteParser(),
              builder: (context, child) {
                return Directionality(
                  textDirection: TextDirection.ltr,
                  child: Overlay(
                    initialEntries: <OverlayEntry>[
                      OverlayEntry(
                        builder: (_) => GestureDetector(
                          onTap: () {
                            final FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus &&
                                currentFocus.focusedChild != null) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            }
                          },
                          child: MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(textScaler: const TextScaler.linear(1.0)),
                            child: Theme(
                              data: ThemeData(
                                fontFamily: 'Myriad Pro',
                              ),
                              child: child ?? const SizedBox.shrink(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
