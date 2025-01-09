import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

AssetGenImage matcherWeatherType(String weatherType) {
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


IconData matcherWeatherTypeIcon(String weatherType) {
  weatherType = weatherType.toLowerCase();
  if (weatherType.contains('cloud')) {
    //TODO think about heavy clouds
    return ShuffleUiKitIcons.cloudoff;
  } else if (weatherType.contains('rain')) {
    return ShuffleUiKitIcons.rain;
  } else if (weatherType.contains('snow')) {
    return Icons.cloudy_snowing;
  } else if (weatherType.contains('thunderstorm')) {
    return Icons.thunderstorm;
  } else if (weatherType.contains('wind')) {
    if (weatherType.contains('strong')) {
      return ShuffleUiKitIcons.windy;
    } else {
      return Icons.wind_power;
    }
  }
  return ShuffleUiKitIcons.sunny;
}