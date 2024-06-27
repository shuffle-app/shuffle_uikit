import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfileHighlightCard extends StatelessWidget {
  final String title;
  final int value;

  const ProfileHighlightCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    TextStyle? valueStyle = textTheme?.title2;
    TextStyle? titleStyle = textTheme?.body;
    titleStyle = titleStyle?.copyWith(color: ColorsFoundation.darkNeutral100);

    return UiKitCardWrapper(
      height: 106,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${value > 1000 ? '${value ~/ 1000}k+' : value}',
            style: valueStyle,
            textAlign: TextAlign.center,
          ),
          SpacingFoundation.verticalSpace12,
          Text(
            title,
            style: titleStyle?.copyWith(
              color: context.uiKitTheme?.colorScheme.grayForegroundColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
