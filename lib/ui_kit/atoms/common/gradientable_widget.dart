import 'package:flutter/material.dart';

class GradientableWidget extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final bool active;

  const GradientableWidget(
      {super.key,
      required this.child,
       this.gradient,
      this.active = true});

  @override
  Widget build(BuildContext context) {
    if(!active || gradient == null) return child;
    
    return ShaderMask(
        shaderCallback: (final Rect bounds) {
          return gradient!.createShader(bounds);
        },
        child: child);
  }
}
