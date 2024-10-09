import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitRatingBadge extends StatelessWidget {
  final int rating;
  final IconData? icon;

  const UiKitRatingBadge({
    super.key,
    required this.rating,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final color = rating >= 5
        ? ColorsFoundation.success
        : rating < 5 && rating >= 3
            ? ColorsFoundation.warning
            : ColorsFoundation.error;

    return UiKitCardWrapper(
      color: color.withOpacity(0.16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageWidget(
            iconData: icon ?? ShuffleUiKitIcons.starfill,
            color: color,
            height: 16,
            fit: BoxFit.cover,
          ),
          SpacingFoundation.horizontalSpace4,
          Text(
            rating.toString(),
            style: textTheme?.caption1Bold.copyWith(color: color),
          ),
        ],
      ).paddingSymmetric(
        vertical: EdgeInsetsFoundation.vertical4,
        horizontal: EdgeInsetsFoundation.horizontal16,
      ),
    );
  }
}
