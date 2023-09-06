import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class DonationInfoIndicatorCard extends StatelessWidget {
  const DonationInfoIndicatorCard({
    super.key,
    required this.number,
    required this.title,
    required this.sum,
    required this.actualSum,
    this.indicatorWidth,
  });

  final String number;
  final String title;
  final double sum;
  final double actualSum;
  final double? indicatorWidth;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return UiKitCardWrapper(
      child: Column(
        children: [
          Row(
            children: [
              Text('#$number', style: theme?.boldTextTheme.subHeadline),
              SpacingFoundation.horizontalSpace12,
              Flexible(
                child: Text(
                  title,
                  style: theme?.boldTextTheme.subHeadline,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SpacingFoundation.verticalSpace16,
          ProgressLinearIndicator(actualSum: actualSum, sum: sum, width: indicatorWidth),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
