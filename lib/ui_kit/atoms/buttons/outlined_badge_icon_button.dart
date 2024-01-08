import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OutlinedBadgeIconButton extends StatelessWidget implements ButtonFactory {
  final BaseUiKitButtonIconData? iconInfo;
  final VoidCallback? onPressed;
  final Alignment? badgeAlignment;
  final Widget? icon;

  const OutlinedBadgeIconButton({
    Key? key,
    this.iconInfo,
    this.onPressed,
    this.badgeAlignment,
    this.icon,
  }) : super(key: key);

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
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.uiKitTheme?.colorScheme.inversePrimary ?? Colors.transparent,
                    width: 2.w,
                  ),
                ),
                padding: EdgeInsets.all(EdgeInsetsFoundation.all6),
                child: icon ??
                    ImageWidget(
                      iconData: iconInfo?.iconData,
                      link: iconInfo?.iconPath,
                      height: iconInfo?.size,
                      fit: BoxFit.fitHeight,
                      color: iconInfo?.color ?? context.uiKitTheme?.colorScheme.inversePrimary,
                    ),
              ),
              if (topLeftBadge)
                Positioned(
                  top: -SpacingFoundation.zero,
                  left: -SpacingFoundation.zero,
                  child: child,
                ),
              if (topRightBadge)
                Positioned(
                  top: -SpacingFoundation.zero,
                  right: -SpacingFoundation.zero,
                  child: child,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
