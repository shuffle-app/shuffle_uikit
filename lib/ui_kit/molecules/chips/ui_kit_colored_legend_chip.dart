import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitColoredLegendChip extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  final String? iconPath;
  final VoidCallback? onTap;
  final bool selected;

  const UiKitColoredLegendChip({
    Key? key,
    required this.text,
    required this.selected,
    this.color,
    this.gradient,
    this.iconPath,
    this.onTap,
  })  :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: selected
          ? _SelectedChip(
              text: text,
              color: color,
              gradient: gradient,
              iconPath: iconPath,
              onTap: onTap,
            )
          : _UnselectedChip(
              text: text,
              color: color,
              gradient: gradient,
              iconPath: iconPath,
              onTap: onTap,
            ),
    );
  }
}

class _SelectedChip extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  final String? iconPath;
  final VoidCallback? onTap;

  const _SelectedChip({
    Key? key,
    required this.text,
    this.color,
    this.gradient,
    this.iconPath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;

    return Material(
      clipBehavior: Clip.hardEdge,
      color: gradient == null ? color : Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: color ?? (gradient != null ? Colors.transparent : Colors.transparent),
          width: 1,
        ),
        borderRadius: BorderRadiusFoundation.max,
      ),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: 0.04.sh,
          decoration: BoxDecoration(
            color: gradient != null ? null : color,
            gradient: color != null ? null : gradient,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageWidget(
                iconData: ShuffleUiKitIcons.check,
                color: colorScheme?.inversePrimary,
              ),
              SpacingFoundation.horizontalSpace2,
              Text(
                text,
                style: regularTextTheme?.caption2,
              ),
              if (iconPath != null)
                ImageWidget(
                  link: iconPath,
                  color: colorScheme?.inverseSurface,
                ).paddingOnly(left: EdgeInsetsFoundation.horizontal2),
            ],
          ).paddingSymmetric(
            horizontal: EdgeInsetsFoundation.horizontal12,
          ),
        ),
      ),
    );
  }
}

class _UnselectedChip extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  final String? iconPath;
  final VoidCallback? onTap;

  const _UnselectedChip({
    Key? key,
    required this.text,
    this.color,
    this.gradient,
    this.iconPath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientableWidget(
      gradient: gradient,
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: color ?? (gradient != null ? Colors.white : Colors.transparent),
            width: 1,
          ),
          borderRadius: BorderRadiusFoundation.max,
        ),
        child: InkWell(
          onTap: onTap,
          child: Ink(
            height: 0.04.sh,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageWidget(
                  iconData: ShuffleUiKitIcons.check,
                  color: color,
                ),
                SpacingFoundation.horizontalSpace2,
                Text(
                  text,
                  style: context.uiKitTheme?.regularTextTheme.caption2.copyWith(
                    color: color ?? Colors.white,
                  ),
                ),
                if (iconPath != null)
                  ImageWidget(
                    link: iconPath,
                    color: color ?? context.uiKitTheme?.colorScheme.inverseSurface,
                  ).paddingOnly(left: EdgeInsetsFoundation.horizontal2),
              ],
            ).paddingSymmetric(
              horizontal: EdgeInsetsFoundation.horizontal12,
            ),
          ),
        ),
      ),
    );
  }
}
