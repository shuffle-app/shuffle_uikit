import 'package:flutter/material.dart';
import 'package:shuffle_uikit/tokens/ui_kit_border_radius.dart';
import 'package:shuffle_uikit/tokens/ui_kit_colors.dart';

class CardWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;

  const CardWrapper({
    Key? key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? UiKitBorderRadius.all24,
        color: UiKitColors.solidSurface,
      ),
      child: child,
    );
  }
}
