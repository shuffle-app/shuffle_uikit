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
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      color: selected ? colorScheme?.inverseSurface : colorScheme?.surface2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          child: Text(
            title,
            style: titleStyle?.copyWith(
              color: selected ? colorScheme?.surface : colorScheme?.inverseSurface,
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
