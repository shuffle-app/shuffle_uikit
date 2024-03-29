import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBadgeColored extends StatelessWidget {
  final String? title;
  final Color color;
  final VoidCallback? onPressed;
  final SvgGenImage? icon;
  final double borderWidth;

  const UiKitBadgeColored(
      {super.key, this.title, required this.color, this.onPressed, this.icon, this.borderWidth = 1,});

  const UiKitBadgeColored.withoutBorder(
      {super.key, this.title, required this.color, this.onPressed, this.icon, this.borderWidth = 0,});

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
              borderRadius: BorderRadius.circular(4.sp),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Text(title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme?.boldTextTheme.caption1Medium
                          .copyWith(color: color)),
                if (icon != null && title != null) 4.w.widthBox,
                if (icon != null)
                  ImageWidget(
                    svgAsset: icon!,
                    height: 30.h,
                    fit: BoxFit.fitHeight,
                    color: color,
                  )
              ],
            )));
  }
}
