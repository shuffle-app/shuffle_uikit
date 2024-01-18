import 'dart:math';

import 'package:flutter/material.dart';

class UiKitFloatingAnimation extends StatefulWidget {
  final Widget child;

  const UiKitFloatingAnimation({super.key, required this.child});

  @override
  State<UiKitFloatingAnimation> createState() => _UiKitFloatingAnimationState();
}

const _kMaxOffset = 18;

class _UiKitFloatingAnimationState extends State<UiKitFloatingAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final double coefficientX;
  late final double coefficientY;

  @override
  void initState() {
    super.initState();
    final rand = Random();
    final duration = Duration(milliseconds: rand.nextInt(500) + 600);
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    coefficientX = rand.nextInt(_kMaxOffset) * (rand.nextBool() ? -1 : 1) / 5;
    coefficientY = rand.nextInt(_kMaxOffset) * (rand.nextBool() ? -1 : 1) / 5;
    _controller.repeat(reverse: true,period: duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(coefficientX * _controller.value, coefficientY * _controller.value),
        filterQuality: FilterQuality.low,
        child: child,
      ),
      child: widget.child,
    );
  }
}
