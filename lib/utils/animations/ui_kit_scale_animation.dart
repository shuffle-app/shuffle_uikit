import 'package:flutter/material.dart';

class UiKitScaleAnimation extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  final double scale;
  final Alignment alignment;

  const UiKitScaleAnimation({
    Key? key,
    required this.controller,
    required this.child,
    this.scale = 1.0,
    this.alignment = Alignment.center,
  }) : super(key: key);

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
