import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:frontend/theme/color.dart';


class MyLoading extends StatefulWidget {
  const MyLoading({super.key});

  @override
  State<MyLoading> createState() => _MyLoadingState();
}

class _MyLoadingState extends State<MyLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 1))
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: MyColors.white['c900']!,
            borderRadius: BorderRadius.circular(32)),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
          child: Image.asset(
            'assets/icons/i16/logo.png',
            width: 112,
            height: 112,
          ),
        ),
      ),
    );
  }
}
