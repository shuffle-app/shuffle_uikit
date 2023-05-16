import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitWeatherInfoCard extends StatelessWidget {
  final String temperature;
  final String weatherType;

  const UiKitWeatherInfoCard({
    Key? key,
    required this.temperature,
    required this.weatherType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final temperatureStyle = textTheme?.subHeadline;
    final weatherTypeStyle = textTheme?.caption1Bold;

    return Container(
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all20,
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
              rasterAsset: GraphicsFoundation.instance.png.weatherIcon,
            ),
          ),
        ],
      ),
    );
  }
}
