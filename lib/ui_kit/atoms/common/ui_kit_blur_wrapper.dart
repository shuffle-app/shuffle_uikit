import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBlurWrapper extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final double? blurValue;
  final Border? border;
  final double? childHorizontalPadding;
  final double? childVerticalPadding;

  const UiKitBlurWrapper({
    super.key,
    required this.child,
    this.borderRadius,
    this.border,
    this.blurValue,
    this.childHorizontalPadding,
    this.childVerticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadiusFoundation.all60,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurValue ?? 16, sigmaY: blurValue ?? 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: border ??
                Border.all(
                  color: Colors.white.withOpacity(0.19),
                  width: 1,
                ),
            borderRadius: borderRadius ?? BorderRadiusFoundation.max,
          ),
          child: child.paddingSymmetric(
            horizontal: childHorizontalPadding ?? EdgeInsetsFoundation.horizontal16,
            vertical: childVerticalPadding ?? EdgeInsetsFoundation.vertical12,
          ),
        ),
      ),
    );
  }
}
