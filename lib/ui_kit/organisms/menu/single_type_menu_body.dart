import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SingleTypeMenuBody<T> extends StatelessWidget {
  final String title;
  final List<UiKitMenuItem<T>> items;
  final bool useCustomTiles;
  final Color? tilesColor;
  final ValueChanged<UiKitMenuItem<T>>? onSelected;
  final Widget? separator;
  final double? customHorizontalPadding;

  const SingleTypeMenuBody({
    super.key,
    required this.title,
    required this.items,
    this.useCustomTiles = false,
    this.onSelected,
    this.tilesColor,
    this.separator,
    this.customHorizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SpacingFoundation.verticalSpace16,
        Text(
          title,
          style: boldTextTheme?.subHeadline,
          textAlign: TextAlign.center,
        ),
        SpacingFoundation.verticalSpace16,
        ...items.map<Widget>(
          (e) {
            print('${e.title}: ${e.enabled}');

            if (useCustomTiles) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UiKitMenuItemTile.custom(
                    item: e,
                    onTap: e.enabled ? () => onSelected?.call(e) : null,
                    color: tilesColor,
                  ),
                  if (separator != null) separator!,
                ],
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UiKitMenuItemTile(
                  item: e,
                  onTap: e.enabled ? () => onSelected?.call(e) : null,
                  color: tilesColor,
                ),
                if (separator != null) separator!,
              ],
            );
          },
        ).toList(),
      ],
    ).paddingSymmetric(horizontal: customHorizontalPadding ?? EdgeInsetsFoundation.horizontal16);
  }
}
