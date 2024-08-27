import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContentRowWithHiddenItems extends UiKitContentUpdateWidget {
  final List<Widget> children;
  final int visibleItemsCount;
  final String placeHolderTitle;
  final String placeholderImagePath;

  @override
  final double height;
  final double width;

  UiKitContentRowWithHiddenItems({
    Key? key,
    required this.children,
    required this.visibleItemsCount,
    required this.placeHolderTitle,
    required this.placeholderImagePath,
    required Size placeholderSize,
  })  : height = placeholderSize.height,
        width = placeholderSize.width,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (visibleItemsCount < children.length)
          ...children.sublist(0, visibleItemsCount).map((child) {
            final isLast = children.indexOf(child) == visibleItemsCount - 1;

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                child,
                SpacingFoundation.horizontalSpace4,
                if (isLast)
                  UiKitContentUpdatePlaceholder(
                    imagePath: placeholderImagePath,
                    title: placeHolderTitle,
                    height: height,
                    width: width,
                  ),
              ],
            );
          }),
        if (visibleItemsCount >= children.length) ...children,
      ],
    );
  }
}
