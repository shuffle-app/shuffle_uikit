import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BadgeIconButton extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final VoidCallback? onPressed;
  final int? badgeValue;

  const BadgeIconButton({
    Key? key,
    this.icon,
    this.onPressed,
    this.badgeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Positioned(
                top: -SpacingFoundation.verticalSpacing4,
                left: -SpacingFoundation.horizontalSpacing4,
                child: Container(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
