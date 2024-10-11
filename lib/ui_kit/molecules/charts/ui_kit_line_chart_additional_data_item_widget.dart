import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLineChartAdditionalDataItemWidget extends StatelessWidget {
  final String title;
  final List<UiKitLineChartAdditionalDataItemGroup> dataItems;
  final double maxWidth;

  const UiKitLineChartAdditionalDataItemWidget({
    Key? key,
    required this.title,
    required this.dataItems,
    required this.maxWidth,
  }) : super(key: key);

  double get progressWidth => maxWidth * 0.625;

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text(
            title,
            style: regularTextTheme?.body,
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        SizedBox(
          width: progressWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: dataItems
                .map<Widget>(
                  (item) => Row(
                    children: [
                      Container(
                        /// to avoid overflow error on the right side need to use 0.75 of the progressWidth
                        width: max(EdgeInsetsFoundation.horizontal4, (item.value / 100) * (progressWidth * 0.75)),
                        height: EdgeInsetsFoundation.vertical4,
                        decoration: BoxDecoration(
                          color: item.color,
                          borderRadius: BorderRadiusFoundation.max,
                        ),
                      ),
                      SpacingFoundation.horizontalSpace4,
                      Text(
                        '${item.value.toStringAsFixed(0)}%',
                        style: regularTextTheme?.caption2.copyWith(color: item.color),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 4);
  }
}
