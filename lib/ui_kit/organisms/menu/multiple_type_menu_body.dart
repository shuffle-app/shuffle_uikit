import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MultipleTypeMenuBody<T> extends StatefulWidget {
  final String title;
  final List<UiKitMenuItem<T>> items;
  final ValueChanged<UiKitMenuItem<T>>? onSelected;
  final List<String?>? allTypes;
  final bool useCustomTiles;
  final Color? tilesColor;
  final Widget? separator;
  final double? customHorizontalPadding;

  MultipleTypeMenuBody({
    super.key,
    required this.title,
    required this.items,
    this.onSelected,
    this.allTypes,
    this.useCustomTiles = false,
    this.tilesColor,
    this.separator,
    this.customHorizontalPadding,
  }) : assert(allTypes?.isNotEmpty ?? true);

  @override
  State<MultipleTypeMenuBody<T>> createState() => _MultipleTypeMenuBodyState<T>();
}

class _MultipleTypeMenuBodyState<T> extends State<MultipleTypeMenuBody<T>> {
  late String? _selectedType = widget.allTypes?.first;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SpacingFoundation.verticalSpace16,
        Text(
          widget.title,
          style: boldTextTheme?.subHeadline,
          textAlign: TextAlign.center,
        ),
        SpacingFoundation.verticalSpace16,
        UiKitCustomTabBar(
          tabs: widget.allTypes?.map<UiKitCustomTab>((e) => UiKitCustomTab(title: e?.toUpperCase() ?? '')).toList() ?? [],
          onTappedTab: (index) => setState(
            () => _selectedType = widget.allTypes?.elementAt(index),
          ),
        ),
        SpacingFoundation.verticalSpace16,
        ...widget.items.where((element) => element.type?.toLowerCase() == _selectedType?.toLowerCase()).map<Widget>(
          (e) {
            if (widget.useCustomTiles) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UiKitMenuItemTile.custom(
                    item: e,
                    onTap: () => widget.onSelected?.call(e),
                    color: widget.tilesColor,
                  ),
                  if (widget.separator != null) widget.separator!,
                ],
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UiKitMenuItemTile(
                  item: e,
                  onTap: () => widget.onSelected?.call(e),
                  color: widget.tilesColor,
                ),
                if (widget.separator != null) widget.separator!,
              ],
            );
          },
        ),
      ],
    ).paddingSymmetric(horizontal: widget.customHorizontalPadding ?? EdgeInsetsFoundation.horizontal16);
  }
}
