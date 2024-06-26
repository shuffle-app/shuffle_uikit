import 'package:flutter/material.dart';

class UiKitScaleAnimation extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  final double scale;
  final Alignment alignment;

  const UiKitScaleAnimation({
    super.key,
    required this.controller,
    required this.child,
    this.scale = 1.0,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          alignment: alignment,
          scale: controller.value + scale,
          child: child,
        );
      },
      child: child,
    );
  }
}
