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
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    this.active = true,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle =
        context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(color: active ? Colors.black : ColorsFoundation.darkNeutral900);
    final valueStyle =
        context.uiKitTheme?.boldTextTheme.subHeadline.copyWith(color: active ? Colors.black : ColorsFoundation.darkNeutral900);

    return Container(
      height: height,
      padding: EdgeInsets.all(EdgeInsetsFoundation.all4),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: active ? Colors.white : UiKitColors.darkNeutral200,
        borderRadius: BorderRadiusFoundation.all20,
      ),
      child: Row(
        children: [
          Container(
            width: height / 2.1,
            decoration: BoxDecoration(
              color: active ? Colors.black : ColorsFoundation.darkNeutral900,
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
                  active ? title : 'OFF',
                  style: active ? titleStyle : valueStyle,
                ),
                SpacingFoundation.verticalSpace2,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      active ? value : 'Health kit',
                      style: active ? valueStyle : titleStyle,
                    ),
                    SpacingFoundation.horizontalSpace4,
                    if (active)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageWidget(
                            svgAsset: GraphicsFoundation.instance.svg.risingTrendIcon,
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
