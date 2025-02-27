import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBadgeColored extends StatelessWidget {
  final String? title;
  final Color color;
  final VoidCallback? onPressed;
  final SvgGenImage? iconSvg;
  final IconData? iconData;
  final double borderWidth;
  final BorderRadius? borderRadius;

  const UiKitBadgeColored({
    super.key,
    this.title,
    required this.color,
    this.onPressed,
    this.iconSvg,
    this.borderWidth = 1,
    this.borderRadius,
    this.iconData,
  }) : assert(iconSvg == null || iconData == null, 'Only one icon can be provided');

  const UiKitBadgeColored.withoutBorder({
    super.key,
    this.title,
    required this.color,
    this.onPressed,
    this.borderRadius,
    this.iconSvg,
    this.iconData,
  })  : borderWidth = 0,
        assert(iconSvg == null || iconData == null, 'Only one icon can be provided');

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(7.sp),
        decoration: BoxDecoration(
          border: borderWidth == 0 ? null : Border.all(width: borderWidth.sp, color: color),
          color: color.withOpacity(0.16),
          borderRadius: borderRadius ?? BorderRadius.circular(4.sp),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null)
              Text(title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme?.boldTextTheme.caption1Medium.copyWith(color: color)),
            if ((iconSvg != null || iconData != null) && title != null) 4.w.widthBox,
            if (iconSvg != null || iconData != null)
              ImageWidget(
                svgAsset: iconSvg,
                iconData: iconData,
                height: 30.h,
                fit: BoxFit.fitHeight,
                color: color,
              )
          ],
        ),
      ),
    );
  }
}
