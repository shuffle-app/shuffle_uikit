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
    Key? key,
    required this.progress,
    required this.width,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

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
            Container(
              color: backgroundColor ?? ColorsFoundation.darkNeutral500,
            ),
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
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
