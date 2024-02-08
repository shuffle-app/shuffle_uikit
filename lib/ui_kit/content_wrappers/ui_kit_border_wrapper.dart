import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBorderWrapper extends StatelessWidget {
  const UiKitBorderWrapper({
    super.key,
    required this.child,
    required this.height,
    this.width,
    this.borderRadius,
    this.border,
    this.backgroundColor,
  });

  final double height;
  final double? width;
  final Widget child;
  final BorderRadius? borderRadius;
  final Border? border;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadiusFoundation.all28,
        border: border ?? GradientFoundation.touchIdgradientBorder,
        color: backgroundColor ?? context.uiKitTheme?.cardTheme.color,
      ),
      child: child,
    );
  }
}
