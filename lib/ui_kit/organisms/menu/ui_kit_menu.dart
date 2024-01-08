import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/organisms/menu/multiple_type_menu_body.dart';
import 'package:shuffle_uikit/ui_kit/organisms/menu/single_type_menu_body.dart';

class UiKitMenu<T> extends StatelessWidget {
  final String title;
  final ValueChanged<UiKitMenuItem<T>>? onSelected;
  final List<UiKitMenuItem<T>> items;
  final UiKitMenuItem<T>? selectedItem;
  final double? customTopPadding;
  final BorderRadiusGeometry? borderRadius;
  final Color? tilesColor;
  final bool useCustomTiles;
  final Widget? separator;
  final bool showBorder;
  final double? menuSheetHorizontalPadding;

  const UiKitMenu({
    Key? key,
    required this.title,
    this.onSelected,
    required this.items,
    this.selectedItem,
    this.customTopPadding,
    this.borderRadius,
    this.tilesColor,
    this.separator,
    this.showBorder = true,
    this.useCustomTiles = false,
    this.menuSheetHorizontalPadding,
  }) : super(key: key);

  bool get singleType {
    for (int itemIndex = 0; itemIndex < items.length; itemIndex++) {
      final currentElement = items.elementAt(itemIndex);
      if (currentElement == items.last) return true;
      final nextElement = items.elementAt(itemIndex + 1);
      if (currentElement.type != nextElement.type) return false;
    }

    return true;
  }

  List<String?>? get allTypes {
    final list = List<String?>.empty(growable: true);
    for (final item in items) {
      if (!list.contains(item.type)) {
        list.add(item.type);
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Material(
      clipBehavior: Clip.hardEdge,
      color: context.uiKitTheme?.colorScheme.surface3,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadiusFoundation.max,
        side: showBorder
            ? BorderSide(
                width: 2,
                color: context.uiKitTheme!.colorScheme.inversePrimary,
              )
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: () {
          //if keyboard is opened, unfocus it
          FocusManager.instance.primaryFocus?.unfocus();
          final elementsHeight = singleType
              ? (items.length + 1) * 48.h
              : (items.where((element) => element.type == allTypes?.first).length + 3) * 41.h;
          // final elementsHeight = ((items.length + 1) * 52) + (SpacingFoundation.verticalSpacing16 * 3);
          final topPadding = customTopPadding ?? max(1.sh - elementsHeight, 0.0);
          showUiKitGeneralFullScreenDialog(
            context,
            GeneralDialogData(
              useRootNavigator: true,
              topPadding: topPadding,
              child: singleType
                  ? SingleTypeMenuBody<T>(
                      title: title,
                      items: items,
                      onSelected: onSelected,
                      tilesColor: tilesColor,
                      useCustomTiles: useCustomTiles,
                      separator: separator,
                      customHorizontalPadding: menuSheetHorizontalPadding,
                    )
                  : MultipleTypeMenuBody<T>(
                      title: title,
                      allTypes: allTypes,
                      items: items,
                      onSelected: onSelected,
                      tilesColor: tilesColor,
                      useCustomTiles: useCustomTiles,
                      separator: separator,
                      customHorizontalPadding: menuSheetHorizontalPadding,
                    ),
            ),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadiusFoundation.max,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (selectedItem == null)
                Text(
                  S.of(context).ChooseOption.toUpperCase(),
                  style: boldTextTheme?.caption1Medium,
                ),
              if (selectedItem != null) ...[
                if (selectedItem?.icon != null || selectedItem?.iconLink != null) ...[
                  ClipRRect(
                    borderRadius: BorderRadiusFoundation.all24,
                    child: ImageWidget(
                      iconData: selectedItem?.icon,
                      link: selectedItem?.iconLink,
                      height: 0.0625.sw,
                      width: 0.0625.sw,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace8,
                ],
                Expanded(
                  child: Text(
                    selectedItem!.title.toUpperCase(),
                    style: boldTextTheme?.caption1Medium,
                  ),
                ),
                ImageWidget(
                  iconData: ShuffleUiKitIcons.chevronright,
                  color: context.uiKitTheme?.colorScheme.inversePrimary,
                ),
              ],
            ],
          ).paddingSymmetric(
            horizontal: EdgeInsetsFoundation.horizontal16,
            vertical: EdgeInsetsFoundation.vertical12,
          ),
        ),
      ).paddingAll(2),
    );
  }
}

class UiKitMenuItem<T> {
  final String title;
  final T? value;
  final IconData? icon;
  final String? iconLink;
  final String? type;
  final Color? iconColor;

  UiKitMenuItem({
    required this.title,
    required this.value,
    this.type,
    this.icon,
    this.iconLink,
    this.iconColor,
  });

  factory UiKitMenuItem.empty() => UiKitMenuItem(
        title: '',
        value: null,
      );
}
