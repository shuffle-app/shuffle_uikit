import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPremiumUserAccountAvatarWrapper extends StatelessWidget {
  final bool disabled;
  final Widget child;
  final double borderWidth;
  final BorderRadius? borderRadius;

  const UiKitPremiumUserAccountAvatarWrapper._({
    Key? key,
    required this.disabled,
    required this.child,
    required this.borderWidth,
    this.borderRadius,
  }) : super(key: key);

  factory UiKitPremiumUserAccountAvatarWrapper.enabled({
    Key? key,
    required Widget child,
    required double borderWidth,
    BorderRadius? borderRadius,
  }) =>
      UiKitPremiumUserAccountAvatarWrapper._(
        key: key,
        disabled: false,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        child: child,
      );

  factory UiKitPremiumUserAccountAvatarWrapper.disabled({
    Key? key,
    required Widget child,
    required double borderWidth,
    BorderRadius? borderRadius,
  }) =>
      UiKitPremiumUserAccountAvatarWrapper._(
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
        border: disabled
            ? Border.all(
                color: ColorsFoundation.darkNeutral400.withOpacity(0.4),
                width: borderWidth,
              )
            : GradientBoxBorder(
                gradient: GradientFoundation.greyGradient,
                width: borderWidth,
              ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadiusFoundation.max,
        child: child,
      ),
    );
  }
}
