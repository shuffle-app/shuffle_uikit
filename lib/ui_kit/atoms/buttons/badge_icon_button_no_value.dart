import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BadgeIconButtonNoValue extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final VoidCallback? onPressed;
  final Alignment? badgeAlignment;

  const BadgeIconButtonNoValue({
    super.key,
    this.icon,
    this.onPressed,
    this.iconInfo,
    this.badgeAlignment,
  }) : assert(iconInfo != null || icon != null, 'Either iconInfo or icon must be provided');

  @override
  Widget build(BuildContext context) {
    final topLeftBadge = badgeAlignment == Alignment.topLeft;
    final topRightBadge = badgeAlignment == Alignment.topRight;
    final child = Container(
      alignment: badgeAlignment,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsFoundation.error,
      ),
      child: const SizedBox().paddingAll(EdgeInsetsFoundation.all4),
    );

    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.none,
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.passthrough,
            children: [
              if (icon != null && iconInfo == null) icon!,
              if (iconInfo != null && icon == null)
                ImageWidget(
                  iconData: iconInfo?.iconData,
                  link: iconInfo?.iconPath,
                  height: iconInfo?.size,
                  fit: BoxFit.fitHeight,
                  color: iconInfo?.color ?? context.uiKitTheme?.colorScheme.inversePrimary,
                ),
              if (topLeftBadge)
                Positioned(
                  top: -SpacingFoundation.verticalSpacing2,
                  left: -SpacingFoundation.horizontalSpacing2,
                  child: child,
                ),
              if (topRightBadge)
                Positioned(
                  top: -SpacingFoundation.verticalSpacing2,
                  right: -SpacingFoundation.horizontalSpacing2,
                  child: child,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
