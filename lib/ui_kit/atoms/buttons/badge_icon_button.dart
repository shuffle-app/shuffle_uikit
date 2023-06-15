import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BadgeIconButton extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final VoidCallback? onPressed;
  final int? badgeValue;
  final Alignment? alignment;

  const BadgeIconButton({
    Key? key,
    this.icon,
    this.onPressed,
    this.badgeValue,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        style: context.uiKitTheme?.boldTextTheme.caption1Bold.copyWith(
          color: Colors.black,
        ),
      ).paddingAll(EdgeInsetsFoundation.all2),
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
              if (icon != null) icon!,
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
