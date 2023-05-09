import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BlurredCardWithGradientBorder extends StatelessWidget {
  final Widget child;

  const BlurredCardWithGradientBorder({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
        border: GradientFoundation.gradientBorder,
        color: Colors.white.withOpacity(0.1),
      ),
      child: child.paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
