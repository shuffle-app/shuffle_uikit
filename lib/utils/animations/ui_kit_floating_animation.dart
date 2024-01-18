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
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: rand.nextInt(500) + 600),
    );
    coefficientX = rand.nextInt(_kMaxOffset) * (rand.nextBool() ? -1 : 1) / 5;
    coefficientY = rand.nextInt(_kMaxOffset) * (rand.nextBool() ? -1 : 1) / 5;
    _controller.forward();
    _controller.addStatusListener(_animationListener);
  }

  _animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_animationListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(coefficientX * _controller.value, coefficientY * _controller.value),
        child: child,
      ),
      child: widget.child,
    );
  }
}
