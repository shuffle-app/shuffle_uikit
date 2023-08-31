import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitStatsActionCard extends StatelessWidget {
  final UiKitStats stats;

  const UiKitStatsActionCard({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      color: ColorsFoundation.surface3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            stats.title,
            style: textTheme?.caption1Medium.copyWith(
              color: ColorsFoundation.darkNeutral900,
            ),
          ),
          Text(
            stats.value,
            style: textTheme?.title2,
          ),
          SpacingFoundation.verticalSpace4,
          stats.actionButton,
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
