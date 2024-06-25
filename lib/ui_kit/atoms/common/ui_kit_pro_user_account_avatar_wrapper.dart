import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../shuffle_uikit.dart';

class UiKitProUserAccountAvatarWrapper extends StatelessWidget {
  final bool disabled;
  final Widget child;
  final double borderWidth;
  final BorderRadius? borderRadius;

  const UiKitProUserAccountAvatarWrapper._({
    super.key,
    required this.disabled,
    required this.child,
    required this.borderWidth,
    this.borderRadius,
  });

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
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: disabled ? 5 : 3,
            offset: Offset.zero,
          ),
        ],
        border: disabled
            ? Border.all(
                width: borderWidth,
                color: ColorsFoundation.darkNeutral400.withOpacity(0.4),
                strokeAlign: BorderSide.strokeAlignOutside)
            : GradientBoxBorder(
                gradient: GradientFoundation.proUserAvatarBorder,
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
