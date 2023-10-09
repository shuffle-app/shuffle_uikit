import 'package:flutter/material.dart';

class UiKitScaleAnimation extends StatelessWidget {
  final AnimationController controller;
  final Widget child;

  const UiKitScaleAnimation({
    Key? key,
    required this.controller,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: controller.value + 1,
          child: child,
        );
      },
      child: child,
    );
  }
}
