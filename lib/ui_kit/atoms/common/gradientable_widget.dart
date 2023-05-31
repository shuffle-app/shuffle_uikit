import 'package:flutter/material.dart';

class GradientableWidget extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final bool active;

  const GradientableWidget(
      {Key? key,
      required this.child,
      required this.gradient,
      this.active = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (final Rect bounds) {
          return gradient.scale(active ? 1 : 0).createShader(bounds);
        },
        child: child);
  }
}
