import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OutlinedIconButton extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final VoidCallback? onPressed;
  final bool? loading;
  final bool hideBorder;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const OutlinedIconButton({
    super.key,
    this.icon,
    this.onPressed,
    this.loading,
    this.borderColor,
    this.iconInfo,
    this.hideBorder = false,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;

    return Material(
      clipBehavior: Clip.hardEdge,
      color: backgroundColor ?? (enabled ? Colors.white.withOpacity(0.01) : ColorsFoundation.darkNeutral300),
      shape: CircleBorder(
        side: hideBorder
            ? BorderSide.none
            : BorderSide(
                color: enabled
                    ? borderColor ?? theme?.colorScheme.inversePrimary ?? Colors.transparent
                    : ColorsFoundation.darkNeutral500,
                width: 2.w,
              ),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.max,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 19, sigmaY: 19),
            child: Padding(
              padding: padding ?? EdgeInsets.all(hideBorder ? EdgeInsetsFoundation.all4 : EdgeInsetsFoundation.all16),
              child: icon ??
                  ImageWidget(
                    iconData: iconInfo?.iconData,
                    link: iconInfo?.iconPath,
                    height: iconInfo?.size,
                    fit: BoxFit.fitHeight,
                    color: iconInfo?.color ?? theme?.colorScheme.inversePrimary,
                  ),
            ),
          ),
        ),
      ),
    ).loadingWrap(loading ?? false, color: colorScheme?.surface);
  }
}
