import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledFilterChip extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onPressed;
  final SvgGenImage icon;

  const UiKitTitledFilterChip({
    Key? key,
    required this.title,
    required this.selected,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.uiKitTheme?.boldTextTheme.caption1Bold;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.white : ColorsFoundation.surface2,
          borderRadius: BorderRadiusFoundation.all24,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageWidget(
              svgAsset: icon,
              color: selected ? Colors.black : Colors.white,
            ),
            SpacingFoundation.horizontalSpace12,
            Text(
              title,
              style: titleStyle?.copyWith(
                color: selected ? Colors.black : Colors.white,
              ),
            ),
          ],
        ).paddingSymmetric(
          horizontal: EdgeInsetsFoundation.horizontal16,
          vertical: EdgeInsetsFoundation.vertical12,
        ),
      ),
    );
  }
}
