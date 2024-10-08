import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMenuItemTile extends StatelessWidget {
  const UiKitMenuItemTile({
    super.key,
    required this.item,
    this.color,
    this.onTap,
  })  : autoPopUp = true,
        paddingSymmetric = null;

  const UiKitMenuItemTile.custom({
    super.key,
    required this.item,
    this.onTap,
    this.color,
    this.paddingSymmetric,
    this.autoPopUp = false,
  });

  final UiKitMenuItem item;
  final VoidCallback? onTap;
  final EdgeInsets? paddingSymmetric;
  final bool autoPopUp;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Opacity(
      opacity: onTap != null ? 1 : 0.75,
      child: Material(
        color: color ?? colorScheme?.surface1,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusFoundation.max,
        ),
        child: InkWell(
          onTap: onTap != null
              ? () {
                  onTap?.call();
                  if (autoPopUp) {
                    Navigator.pop(context);
                  }
                }
              : null,
          child: Ink(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: colorScheme!.surface2, width: 1),
              ),
              // borderRadius: BorderRadiusFoundation.max,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (item.icon != null || item.iconLink != null) ...[
                  ImageWidget(
                    iconData: item.icon,
                    link: item.iconLink,
                    height: 0.0625.sw,
                    width: 0.0625.sw,
                    fit: BoxFit.cover,
                    color: item.iconColor,
                  ),
                  SpacingFoundation.horizontalSpace8,
                ],
                Expanded(
                  child: AutoSizeText(
                    item.title.toUpperCase(),
                    maxLines: 2,
                    group: _autoSizeTextGroup,
                    style: boldTextTheme?.caption1UpperCaseMedium,
                  ),
                ),
              ],
            ).paddingSymmetric(
              horizontal: paddingSymmetric?.horizontal ?? EdgeInsetsFoundation.horizontal16,
              vertical: paddingSymmetric?.vertical ?? EdgeInsetsFoundation.vertical16,
            ),
          ),
        ),
      ),
    );
  }
}

class UiKitMenuItemTileModel<T> {
  final String title;
  final Widget? icon;
  final T value;

  UiKitMenuItemTileModel({
    required this.title,
    required this.value,
    this.icon,
  });
}

final _autoSizeTextGroup = AutoSizeGroup();