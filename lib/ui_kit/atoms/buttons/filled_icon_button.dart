import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class FilledIconButton extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback? onPressed;

  const FilledIconButton({
    super.key,
    this.icon,
    this.iconInfo,
    this.onPressed,
    this.backgroundColor,
    this.borderColor,
  }) : assert(icon != null || iconInfo != null, 'Either icon or iconInfo must be provided');

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      color: enabled ? backgroundColor ?? colorScheme?.inversePrimary : ColorsFoundation.darkNeutral300,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderColor != null ? 2.w : 0.0,
            ),
          ),
          child: Padding(
            padding: iconInfo?.padding ?? EdgeInsets.all(EdgeInsetsFoundation.all14),
            child: icon ??
                ImageWidget(
                  iconData: iconInfo?.iconData,
                  link: iconInfo?.iconPath,
                  height: iconInfo?.size,
                  fit: BoxFit.fitHeight,
                  color: iconInfo?.color ?? colorScheme?.primary,
                ),
          ),
        ),
      ),
    );
  }
}
