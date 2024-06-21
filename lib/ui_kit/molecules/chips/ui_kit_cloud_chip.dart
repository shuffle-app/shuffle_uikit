import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCloudChip extends StatefulWidget {
  const UiKitCloudChip({
    super.key,
    this.onTap,
    required this.title,
    this.icon,
    this.isSelectable,
  });

  final VoidCallback? onTap;
  final String title;
  final IconData? icon;
  final bool? isSelectable;

  @override
  State<UiKitCloudChip> createState() => _UiKitCloudChipState();
}

class _UiKitCloudChipState extends State<UiKitCloudChip> {
  bool selectable = false;

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    final BoxDecoration selectableDecoration = BoxDecoration(
      border: Border.all(color: ColorsFoundation.info),
      borderRadius: BorderRadiusFoundation.all6,
      color: ColorsFoundation.info.withOpacity(0.2),
      boxShadow: [
        BoxShadow(
            color: ColorsFoundation.info.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 3,
            spreadRadius: 0),
      ],
    );
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.onTap?.call();
          if (widget.isSelectable != null) {
            setState(() {
              selectable = !selectable;
            });
          }
        },
        borderRadius: BorderRadiusFoundation.all6,
        child: Ink(
          decoration: selectable
              ? selectableDecoration
              : BoxDecoration(
                  border: Border.all(
                    color:
                        uiKitTheme?.colorScheme.darkNeutral900 ?? Colors.black,
                  ),
                  borderRadius: BorderRadiusFoundation.all6,
                  color: uiKitTheme?.colorScheme.surface.withOpacity(0.1),
                ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: selectable
                      ? ColorsFoundation.info
                      : uiKitTheme?.colorScheme.bodyTypography,
                  size: 18.sp,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal4),
              Text(widget.title,
                  style: uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
                    color: selectable
                        ? ColorsFoundation.info
                        : uiKitTheme.colorScheme.bodyTypography,
                  ),
                  textAlign: TextAlign.center),
            ],
          ).paddingAll(EdgeInsetsFoundation.all4),
        ),
      ),
    );
  }
}
