import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/theme/theme_bloc.dart';
import '../core/constants/duration_constants.dart';

class AppCircularProgressIndicator extends StatefulWidget {
  const AppCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  State<AppCircularProgressIndicator> createState() =>
      _AppCircularProgressIndicatorState();
}

class _AppCircularProgressIndicatorState
    extends State<AppCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: DurationConstants.s1);
    _animationController
      ..addListener(_updateUI)
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeListener(_updateUI);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
      child: CustomPaint(
        size: const Size.fromRadius(20),
        painter: _GradientCircularProgressPainter(
            radius: 20,
            strokeWidth: 2,
            colors: context.read<ThemeBloc>().isDarkMode
                ? const [
                    Color.fromARGB(20, 135, 184, 215),
                    Color.fromARGB(120, 135, 184, 215),
                  ]
                : const [
                    Color.fromARGB(20, 0, 83, 154),
                    Color.fromARGB(100, 0, 83, 154),
                  ]),
      ),
    );
  }

  void _updateUI() {
    setState(() {});
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter({
    required this.radius,
    required this.strokeWidth,
    required this.colors,
  });

  final double radius;
  final double strokeWidth;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader =
        SweepGradient(colors: colors, startAngle: 0.0, endAngle: 2 * pi)
            .createShader(rect);
    canvas.drawArc(rect, 0.0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
