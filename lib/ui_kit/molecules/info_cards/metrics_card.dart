import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/ui_kit_external.dart';

class UiKitMetricsCard extends StatelessWidget {
  final String title;
  final int value;
  final String unit;
  final Widget icon;

  const UiKitMetricsCard({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(color: Colors.black);
    final valueStyle = context.uiKitTheme?.boldTextTheme.subHeadline.copyWith(color: Colors.black);
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusFoundation.all16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 26.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadiusFoundation.max,
            ),
            child: Center(child: icon),
          ),
          SpacingFoundation.horizontalSpace8,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: titleStyle,
                ),
                SpacingFoundation.verticalSpace2,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      value.toStringAsFixed(0),
                      style: valueStyle,
                    ),
                    SpacingFoundation.horizontalSpace4,
                    Column(
                      mainAxisSize: MainAxisSize.max,
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
      ).paddingAll(EdgeInsetsFoundation.all4),
    );
  }
}
