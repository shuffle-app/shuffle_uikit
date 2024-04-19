import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'dart:io';

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
    const offColor = ColorsFoundation.darkNeutral900;
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;
    final temperatureStyle = textTheme?.subHeadline.copyWith(color: active ? null : offColor);
    final weatherTypeStyle = textTheme?.caption1Bold.copyWith(color: active ? null : offColor);
    final isNight = TimeOfDay.fromDateTime(DateTime.now()).isNight;

    return Container(
      height: active && Platform.isIOS ? height - 8.w : height,
      decoration: BoxDecoration(
        color: active ? null : colorScheme?.surface2,
        borderRadius: BorderRadiusFoundation.all20,
        border: Border.fromBorderSide(BorderSide(width: 1, color: offColor.withOpacity(0.1))),
        gradient: active
            ? isNight
                ? GradientFoundation.blueLinearGradient
                : GradientFoundation.yellowLinearGradient
            : null,
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    active ? '$temperature°C' : S.of(context).Off.toUpperCase(),
                    style: temperatureStyle,
                  ),
                  Text(
                    active ? weatherType : S.of(context).Weather,
                    style: weatherTypeStyle,
                  ),
                ],
              )),
          SpacingFoundation.horizontalSpace16,
          Flexible(
              child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: active ? (isNight ? ColorsFoundation.weatherBlue : ColorsFoundation.weatherYellow) : offColor,
                  blurRadius: 32,
                  offset: Offset.zero,
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: ImageWidget(
              rasterAsset: _matcherWeatherType(weatherType),
              color: active ? null : offColor,
              width: 40.w,
              fit: BoxFit.fitWidth,
            ),
          )),
        ],
      ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing4),
    );
  }

  AssetGenImage _matcherWeatherType(String weatherType) {
    weatherType = weatherType.toLowerCase();
    final isNight = TimeOfDay.fromDateTime(DateTime.now()).isNight;
    if (weatherType.contains('cloud')) {
      //TODO think about heavy clouds
      return isNight ? GraphicsFoundation.instance.png.moonClouds : GraphicsFoundation.instance.png.sunClouds;
    } else if (weatherType.contains('rain')) {
      return GraphicsFoundation.instance.png.rain;
    } else if (weatherType.contains('snow')) {
      return GraphicsFoundation.instance.png.lightSnowfall;
    } else if (weatherType.contains('thunderstorm')) {
      return GraphicsFoundation.instance.png.thunderstorm;
    } else if (weatherType.contains('wind')) {
      if (weatherType.contains('strong')) {
        return GraphicsFoundation.instance.png.windy;
      } else {
        return isNight ? GraphicsFoundation.instance.png.moonWindy : GraphicsFoundation.instance.png.sunWindy;
      }
    }
    return isNight ? GraphicsFoundation.instance.png.moonClear : GraphicsFoundation.instance.png.sunClear;
  }
}
