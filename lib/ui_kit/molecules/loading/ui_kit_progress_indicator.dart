import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/border_radius_foundation.dart';
import 'package:shuffle_uikit/foundation/colors_foundation.dart';
import 'package:shuffle_uikit/foundation/gradient_foundation.dart';

class UiKitProgressIndicator extends StatelessWidget {
  final double progress;
  final double width;
  final Color? color;
  final Color? backgroundColor;

  const UiKitProgressIndicator({
    super.key,
    required this.progress,
    required this.width,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusFoundation.max,
      child: SizedBox(
        height: 4,
        width: width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColoredBox(
              color: backgroundColor ?? ColorsFoundation.darkNeutral500,
            ),
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: max(0.01, progress),
              child: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusFoundation.max,
                  gradient: color == null ? GradientFoundation.touchIdLinearGradient : null,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
