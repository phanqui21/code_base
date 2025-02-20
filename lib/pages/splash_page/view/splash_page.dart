import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:code_base/config/app_router.dart';
import 'package:code_base/core/resource/app_images.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () => context.pushRoute(const HomeRoute()));
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppImages.animation,
        ),
      ),
    );
  }
}
