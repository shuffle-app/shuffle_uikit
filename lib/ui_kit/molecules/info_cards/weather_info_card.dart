import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherInfoCard extends StatelessWidget {
  final String temperature;
  final String weatherType;

  const WeatherInfoCard({
    Key? key,
    required this.temperature,
    required this.weatherType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final prefix = temperature.isNegative ? '-' : '+';
    final temperatureStyle = context.uiKitTheme?.boldTextTheme.subHeadline;
    final weatherTypeStyle = context.uiKitTheme?.boldTextTheme.caption1Bold;
    return Container(
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all16,
        gradient: GradientFoundation.yellowLinearGradient,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$temperature°C',
                style: temperatureStyle,
              ),
              Text(
                weatherType,
                style: weatherTypeStyle,
              ),
            ],
          ),
          SpacingFoundation.horizontalSpace16,
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorsFoundation.weatherYellow,
                  blurRadius: 32,
                  offset: Offset.zero,
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: ImageWidget(
              rasterAsset: Assets.images.png.weatherIcon,
            ),
          ),
        ],
      ),
    );
  }
}
