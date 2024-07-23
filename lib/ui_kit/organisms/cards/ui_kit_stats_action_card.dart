import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitStatsActionCard extends StatelessWidget {
  final UiKitStats stats;
  final AutoSizeGroup? group;

  const UiKitStatsActionCard({
    super.key,
    this.group,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      width: 110.w,
      color: context.uiKitTheme?.colorScheme.surface1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            stats.title,
            style: textTheme?.caption1Medium.copyWith(
              color: ColorsFoundation.mutedText,
            ),
          ),
          AutoSizeText(
            group: group,
            stats.value,
            maxLines: 1,
            style: textTheme?.title2,
          ),
          SpacingFoundation.verticalSpace4,
          stats.actionButton,
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
