import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitOrdinaryChip extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool selected;

  const UiKitOrdinaryChip({
    super.key,
    required this.title,
    this.onPressed,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.uiKitTheme?.boldTextTheme.caption1Bold;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      color: selected ? Colors.white : ColorsFoundation.surface2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          child: Text(
            title,
            style: titleStyle?.copyWith(
              color: selected ? Colors.black : Colors.white,
            ),
          ).paddingSymmetric(
            horizontal: SpacingFoundation.horizontalSpacing16,
            vertical: SpacingFoundation.verticalSpacing12,
          ),
        ),
      ),
    );
  }
}
