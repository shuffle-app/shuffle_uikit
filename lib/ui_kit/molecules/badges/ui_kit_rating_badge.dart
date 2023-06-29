import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitRatingBadge extends StatelessWidget {
  final double rating;
  final String? iconPath;

  const UiKitRatingBadge({
    super.key,
    required this.rating,
    this.iconPath,
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
            link: iconPath ?? GraphicsFoundation.instance.svg.star.path,
            color: color,
            height: 16,
            fit: BoxFit.cover,
          ),
          SpacingFoundation.horizontalSpace4,
          Text(
            rating.toStringAsFixed(0),
            style: textTheme?.caption1Bold.copyWith(color: color),
          ),
        ],
      ).paddingSymmetric(
        vertical: EdgeInsetsFoundation.vertical6,
        horizontal: EdgeInsetsFoundation.horizontal12,
      ),
    );
  }
}
