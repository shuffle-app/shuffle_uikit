import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitGlowingProgressIndicator extends StatelessWidget {
  final String? title;
  final double maxValue;
  final double value;
  final double maxWidth;
  final Color progressColor;

  const UiKitGlowingProgressIndicator({
    Key? key,
    this.title,
    required this.maxValue,
    required this.value,
    required this.maxWidth,
    required this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title ?? '',
                style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.mutedText),
              ),
            ),
            SpacingFoundation.horizontalSpace4,
            Text(
              '${value.toInt()}/${maxValue.toInt()}',
              style: boldTextTheme?.caption1Bold,
            ),
          ],
        ),
        SpacingFoundation.verticalSpace8,
        Container(
          height: 8,
          width: maxWidth,
          decoration: BoxDecoration(
            color: ColorsFoundation.neutral16,
            borderRadius: BorderRadiusFoundation.max,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 8,
              width: (value / maxValue) * maxWidth,
              decoration: BoxDecoration(
                color: progressColor,
                borderRadius: BorderRadiusFoundation.max,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: colorScheme?.inverseSurface.withOpacity(0.4) ?? Colors.white.withOpacity(0.4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
