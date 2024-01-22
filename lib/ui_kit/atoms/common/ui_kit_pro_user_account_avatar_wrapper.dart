import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/foundation/border_radius_foundation.dart';
import 'package:shuffle_uikit/foundation/colors_foundation.dart';
import 'package:shuffle_uikit/foundation/gradient_foundation.dart';

class UiKitProUserAccountAvatarWrapper extends StatelessWidget {
  final bool disabled;
  final Widget child;
  final double borderWidth;
  final BorderRadius? borderRadius;

  const UiKitProUserAccountAvatarWrapper._({
    Key? key,
    required this.disabled,
    required this.child,
    required this.borderWidth,
    this.borderRadius,
  }) : super(key: key);

  factory UiKitProUserAccountAvatarWrapper.enabled({
    Key? key,
    required Widget child,
    required double borderWidth,
    BorderRadius? borderRadius,
  }) =>
      UiKitProUserAccountAvatarWrapper._(
        key: key,
        disabled: false,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        child: child,
      );

  factory UiKitProUserAccountAvatarWrapper.disabled({
    Key? key,
    required Widget child,
    required double borderWidth,
    BorderRadius? borderRadius,
  }) =>
      UiKitProUserAccountAvatarWrapper._(
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
                gradient: GradientFoundation.proUserAvatarBorder,
                width: borderWidth,
              ),
      ),
      // child: child,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadiusFoundation.max,
        child: child,
      ),
    );
  }
}
