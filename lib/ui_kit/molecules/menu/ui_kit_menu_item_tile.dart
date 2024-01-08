import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMenuItemTile extends StatelessWidget {
  const UiKitMenuItemTile({
    Key? key,
    required this.item,
    this.color,
    this.onTap,
  })  : autoPopUp = true,
        showSeparator = true,
        paddingSymmetric = null,
        super(key: key);

  const UiKitMenuItemTile.custom({
    Key? key,
    required this.item,
    this.onTap,
    this.color,
    this.paddingSymmetric,
    this.autoPopUp = false,
    this.showSeparator = false,
  }) : super(key: key);

  final UiKitMenuItem item;
  final VoidCallback? onTap;
  final EdgeInsets? paddingSymmetric;
  final bool autoPopUp;
  final bool showSeparator;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      color: color ?? Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.max,
      ),
      child: InkWell(
        onTap: () {
          onTap?.call();
          if (autoPopUp) {
            Navigator.pop(context);
          }
        },
        child: Ink(
          decoration: showSeparator
              ? BoxDecoration(
                  border: Border(
                    top: BorderSide(color: colorScheme!.surface2, width: 1),
                  ),
                )
              : null,
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
                child: Text(
                  item.title.toUpperCase(),
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
