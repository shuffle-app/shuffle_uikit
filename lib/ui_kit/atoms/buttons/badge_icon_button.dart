import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BadgeIconButton extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final VoidCallback? onPressed;
  final int? badgeValue;
  final Alignment? alignment;

  const BadgeIconButton({
    super.key,
    this.icon,
    this.iconInfo,
    this.onPressed,
    this.badgeValue,
    this.alignment,
  })  : assert(iconInfo != null || icon != null, 'Either iconInfo or icon must be provided');

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final topLeftBadge = alignment == Alignment.topLeft;
    final topRightBadge = alignment == Alignment.topRight;
    final child = Container(
      alignment: alignment,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: GradientFoundation.defaultRadialGradient,
      ),
      child: Text(
        '$badgeValue',
        style: theme?.boldTextTheme.caption1Bold.copyWith(
          color: theme.colorScheme.surface,
        ),
      ).paddingAll(EdgeInsetsFoundation.all4),
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
              if (iconInfo != null)
                ImageWidget(
                  iconData: iconInfo?.iconData,
                  link: iconInfo?.iconPath,
                  height: iconInfo?.size,
                  fit: BoxFit.fitHeight,
                  color: iconInfo?.color ?? theme?.colorScheme.inverseSurface,
                ),
              if (topLeftBadge || alignment == null)
                Positioned(
                  top: -SpacingFoundation.verticalSpacing4,
                  left: -SpacingFoundation.horizontalSpacing4,
                  child: child,
                ),
              if (topRightBadge)
                Positioned(
                  right: -SpacingFoundation.horizontalSpacing4,
                  top: -SpacingFoundation.verticalSpacing4,
                  child: child,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
