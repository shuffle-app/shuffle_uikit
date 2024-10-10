import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallButtonWithIcon extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  const SmallButtonWithIcon({
    super.key,
    this.icon,
    this.onPressed,
    this.iconInfo,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: backgroundColor ?? Colors.white.withOpacity(0.1),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.1),
          ),
          child: Padding(
            padding: EdgeInsets.all(EdgeInsetsFoundation.all8),
            child: icon ??
                ImageWidget(
                  iconData: iconInfo?.iconData,
                  link: iconInfo?.iconPath,
                  height: iconInfo?.size,
                  fit: BoxFit.fitHeight,
                  color: iconInfo?.color ?? context.uiKitTheme?.colorScheme.surface,
                ),
          ),
        ),
      ),
    );
  }
}
