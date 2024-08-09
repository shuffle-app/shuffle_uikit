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
  })  : assert(color != null || gradient != null, 'Can\'t have both color and gradient'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: Material(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusFoundation.max,
          side: BorderSide(
            color: selected
                ? color ?? colorScheme?.primary ?? Colors.white
                : color ?? colorScheme?.surface ?? Colors.white,
          ),
        ),
        color: gradient == null
            ? selected
                ? color
                : Colors.transparent
            : Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            height: 0.04.sh,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              decoration: BoxDecoration(
                gradient: gradient,
                color: gradient == null
                    ? selected
                        ? color
                        : Colors.transparent
                    : Colors.transparent,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageWidget(
                    iconData: ShuffleUiKitIcons.check,
                    color: selected ? colorScheme?.inversePrimary : color,
                  ),
                  SpacingFoundation.horizontalSpace2,
                  Text(
                    text,
                    style: regularTextTheme?.caption2.copyWith(
                      color: selected ? colorScheme?.inversePrimary : color,
                    ),
                  ),
                  if (iconPath != null)
                    ImageWidget(
                      link: iconPath,
                      color: selected ? colorScheme?.inverseSurface : color,
                    ).paddingOnly(left: EdgeInsetsFoundation.horizontal2),
                ],
              ).paddingSymmetric(
                horizontal: EdgeInsetsFoundation.horizontal12,
              ),
            ),
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
    final colorScheme = context.uiKitTheme?.colorScheme;

    return GradientableWidget(
      gradient: gradient,
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: color ?? (gradient != null ? Colors.white : Colors.transparent),
          ),
          borderRadius: BorderRadiusFoundation.max,
        ),
        child: InkWell(
          onTap: onTap,
          child: Ink(
            height: 0.04.sh,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: color ?? (gradient != null ? Colors.white : Colors.transparent),
              ),
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
