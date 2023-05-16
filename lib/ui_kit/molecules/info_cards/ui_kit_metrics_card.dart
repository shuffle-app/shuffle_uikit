import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMetricsCard extends StatelessWidget {
  final String title;
  final String value;
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
      height: 60.h,
      padding: EdgeInsets.all(EdgeInsetsFoundation.all4),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusFoundation.all20,
      ),
      child: Row(
        children: [
          Container(
            width: 26.w,
            decoration: BoxDecoration(
              color: Colors.black,
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
                  title,
                  style: titleStyle,
                ),
                SpacingFoundation.verticalSpace2,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      value,
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
      ),
    );
  }
}
