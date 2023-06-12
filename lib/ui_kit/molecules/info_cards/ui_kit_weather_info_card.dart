import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitWeatherInfoCard extends StatelessWidget {
  final String temperature;
  final String weatherType;
  final bool active;
  final double height;

  const UiKitWeatherInfoCard({
    Key? key,
    required this.temperature,
    required this.weatherType,
     this.active = true,
     this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final offColor = ColorsFoundation.darkNeutral900;
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final temperatureStyle = textTheme?.subHeadline.copyWith(color: active ? null : offColor);
    final weatherTypeStyle = textTheme?.caption1Bold.copyWith(color: active ? null : offColor);



    return Container(
      height: height,
      // padding: EdgeInsets.symmetric(vertical: 11.h,horizontal: 16.w),

      decoration: BoxDecoration(
        color: active? null : ColorsFoundation.surface2,
        borderRadius: BorderRadiusFoundation.all20,
        border: Border.fromBorderSide(
            BorderSide(width: 1,color: offColor.withOpacity(0.1))
        ),
        gradient: active ? GradientFoundation.yellowLinearGradient : null,
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                active ? '$temperature°C' : 'OFF',
                style: temperatureStyle,
              ),
              Text(
                active ? weatherType : 'Weather',
                style: weatherTypeStyle,
              ),
            ],
          ),
          SpacingFoundation.horizontalSpace16,
          Container(
            decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: active ? ColorsFoundation.weatherYellow : offColor,
                  blurRadius: 32,
                  offset: Offset.zero,
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: ImageWidget(
              svgAsset: GraphicsFoundation.instance.svg.sunWind,
              color: active ? null : offColor,
            ),
          ),
        ],
      ),
    );
  }
}
