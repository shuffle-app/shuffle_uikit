import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMenu<T> extends StatelessWidget {
  final String title;
  final ValueChanged<UiKitMenuItem<T?>>? onSelected;
  final List<UiKitMenuItem<T?>> items;
  final UiKitMenuItem? selectedItem;

  const UiKitMenu({
    Key? key,
    required this.title,
    this.onSelected,
    required this.items,
    this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: boldTextTheme?.labelLarge,
        ),
        SpacingFoundation.verticalSpace4,
        Material(
          clipBehavior: Clip.hardEdge,
          color: ColorsFoundation.surface3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.all24,
            side: const BorderSide(
              width: 2,
              color: Colors.white,
            ),
          ),
          child: InkWell(
            onTap: () {
              final elementsHeight = ((items.length + 1) * 52) + (SpacingFoundation.verticalSpacing16 * 3);
              final topPadding = max(1.sh - elementsHeight, 0.0);
              showUiKitGeneralFullScreenDialog(
                context,
                topPadding: topPadding,
                child: Column(
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
                    ...items
                        .map<Widget>(
                          (e) => UiKitMenuItemTile(
                            item: e,
                            onTap: () => onSelected?.call(e),
                          ),
                        )
                        .toList(),
                  ],
                ),
              );
            },
            child: Ink(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (selectedItem == null)
                    Text(
                      'Choose option',
                      style: boldTextTheme?.caption1Medium,
                    ),
                  if (selectedItem != null) ...[
                    selectedItem!.icon!,
                    SpacingFoundation.horizontalSpace8,
                    Expanded(
                      child: Text(
                        selectedItem!.title.toUpperCase(),
                        style: boldTextTheme?.caption1Medium,
                      ),
                    ),
                    ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.chevronRight,
                      color: Colors.white,
                    ),
                  ],
                ],
              ).paddingSymmetric(
                horizontal: EdgeInsetsFoundation.horizontal16,
                vertical: EdgeInsetsFoundation.vertical12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UiKitMenuItem<T> {
  final String title;
  final T? value;
  final Widget? icon;

  UiKitMenuItem({
    required this.title,
    required this.value,
    this.icon,
  });

  factory UiKitMenuItem.empty() => UiKitMenuItem(
        title: '',
        value: null,
      );
}
