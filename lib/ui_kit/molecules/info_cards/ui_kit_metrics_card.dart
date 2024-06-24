import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMetricsCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final Widget icon;
  final bool active;
  final double height;

  const UiKitMetricsCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    this.active = true,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;
    final titleStyle = context.uiKitTheme?.boldTextTheme.caption2Bold
        .copyWith(color: active ? colorScheme?.surface : ColorsFoundation.darkNeutral900);
    final valueStyle = context.uiKitTheme?.boldTextTheme.subHeadline
        .copyWith(color: active ? colorScheme?.surface : ColorsFoundation.darkNeutral900);

    return Container(
      height: height,
      padding: EdgeInsets.all(EdgeInsetsFoundation.all4),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: active ? colorScheme?.inverseSurface : UiKitColors.darkNeutral200,
        borderRadius: BorderRadiusFoundation.all20,
      ),
      child: Row(
        children: [
          Container(
            width: height / 2.1,
            decoration: BoxDecoration(
              color: active ? colorScheme?.surface : ColorsFoundation.darkNeutral900,
              borderRadius: BorderRadiusFoundation.all20,
            ),
            child: Center(child: icon),
          ),
          SpacingFoundation.horizontalSpace4,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  active ? title : S.of(context).Off.toUpperCase(),
                  style: active ? titleStyle : valueStyle,
                ),
                SpacingFoundation.verticalSpace2,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        child: Text(
                      active ? value : S.of(context).HealthKit,
                      maxLines: 2,
                      style: active ? valueStyle : titleStyle,
                    )),
                    SpacingFoundation.horizontalSpace4,
                    if (active)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ImageWidget(
                            iconData: ShuffleUiKitIcons.risingTrendIcon,
                          ),
                          Text(
                            unit,
                            style: titleStyle?.copyWith(fontSize: 8),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
