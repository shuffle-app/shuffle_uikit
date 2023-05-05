import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitWeatherInfoCard extends StatelessWidget {
  final int temperature;
  final String weatherType;

  const UiKitWeatherInfoCard({
    Key? key,
    required this.temperature,
    required this.weatherType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefix = temperature.isNegative ? '-' : '+';
    final temperatureStyle = context.uiKitTheme?.boldTextTheme.subHeadline;
    final weatherTypeStyle = context.uiKitTheme?.boldTextTheme.caption1Bold;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all16,
        gradient: GradientFoundation.yellowLinearGradient,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$prefix$temperature°C',
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
      ).paddingSymmetric(
        horizontal: EdgeInsetsFoundation.horizontal16,
        vertical: EdgeInsetsFoundation.vertical8,
      ),
    );
  }
}
