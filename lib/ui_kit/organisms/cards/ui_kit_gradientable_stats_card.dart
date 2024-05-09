import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitGradientableStatsCard extends StatelessWidget {
  final UiKitStats stats;
  final Gradient gradient;
  final int? maxLines;

  const UiKitGradientableStatsCard({
    Key? key,
    required this.stats,
    required this.gradient,
    this.maxLines,
  }) : super(key: key);

  double get height {
    if (1.sw <= 375) return 0.175.sh;
    return 0.15.sh;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      color: colorScheme?.surface2,
      height: height,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GradientableWidget(
              gradient: gradient,
              child: Text(
                stats.value,
                style: boldTextTheme?.title2,
                textAlign: TextAlign.center,
                maxLines: maxLines ?? 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SpacingFoundation.verticalSpace12,
            Text(
              stats.title,
              style: boldTextTheme?.caption1Bold,
              textAlign: TextAlign.center,
              maxLines: maxLines ?? 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all12),
      ),
    );
  }
}
