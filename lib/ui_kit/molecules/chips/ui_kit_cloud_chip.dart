import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCloudChip extends StatelessWidget {
  const UiKitCloudChip({
    super.key,
    this.onTap,
    required this.title,
    this.iconPath,
    this.selected = false,
  });

  final VoidCallback? onTap;
  final String title;
  final String? iconPath;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    final BoxDecoration selectableDecoration = BoxDecoration(
      border: Border.all(color: ColorsFoundation.info),
      borderRadius: BorderRadiusFoundation.all6,
      color: ColorsFoundation.info.withOpacity(0.2),
      boxShadow: [
        BoxShadow(
            color: ColorsFoundation.info.withOpacity(0.3), offset: const Offset(0, 2), blurRadius: 3, spreadRadius: 0),
      ],
    );
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadiusFoundation.all6,
        child: Ink(
          decoration: selected
              ? selectableDecoration
              : BoxDecoration(
                  border: Border.all(
                    color: uiKitTheme?.colorScheme.darkNeutral900 ?? Colors.black,
                  ),
                  borderRadius: BorderRadiusFoundation.all6,
                  color: uiKitTheme?.colorScheme.surface.withOpacity(0.1),
                ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null)
                ImageWidget(
                  link: iconPath,
                  color: selected ? ColorsFoundation.info : uiKitTheme?.colorScheme.bodyTypography,
                  width: 18.sp,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal4),
              Text(title,
                  style: uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
                    color: selected ? ColorsFoundation.info : uiKitTheme.colorScheme.bodyTypography,
                  ),
                  textAlign: TextAlign.center),
            ],
          ).paddingAll(EdgeInsetsFoundation.all4),
        ),
      ),
    );
  }
}
