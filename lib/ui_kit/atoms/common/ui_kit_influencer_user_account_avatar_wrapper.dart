import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInfluencerUserAccountAvatarWrapper extends StatelessWidget {
  final bool disabled;
  final Widget child;
  final double borderWidth;
  final BorderRadius? borderRadius;

  const UiKitInfluencerUserAccountAvatarWrapper._({
    Key? key,
    required this.disabled,
    required this.child,
    required this.borderWidth,
    this.borderRadius,
  }) : super(key: key);

  factory UiKitInfluencerUserAccountAvatarWrapper.enabled({
    Key? key,
    required Widget child,
    required double borderWidth,
    BorderRadius? borderRadius,
  }) =>
      UiKitInfluencerUserAccountAvatarWrapper._(
        key: key,
        disabled: false,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        child: child,
      );

  factory UiKitInfluencerUserAccountAvatarWrapper.disabled({
    Key? key,
    required Widget child,
    required double borderWidth,
    BorderRadius? borderRadius,
  }) =>
      UiKitInfluencerUserAccountAvatarWrapper._(
        key: key,
        disabled: true,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorsFoundation.darkNeutral400,
          borderRadius: borderRadius ?? BorderRadiusFoundation.max,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.25),
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset.zero,
            )
          ]),
      foregroundDecoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadiusFoundation.max,
        border: disabled
            ? Border.all(
                color: ColorsFoundation.darkNeutral400.withOpacity(0.4),
                width: borderWidth,
              )
            : GradientBoxBorder(
                gradient: GradientFoundation.defaultRadialGradient,
                width: borderWidth,
              ),
      ),
      child: child,
    );
  }
}
