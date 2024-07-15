import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPlaceWeatherAnimation extends StatelessWidget {
  final PlaceWeatherType weatherType;

  const UiKitPlaceWeatherAnimation({
    super.key,
    required this.weatherType,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.max,
      ),
      color: Colors.white.withOpacity(0.15),
      child: Container(
        width: 32,
        height: 32,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusFoundation.all40,
          color: ColorsFoundation.surface.withOpacity(0.2),
        ),
        alignment: Alignment.center,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: LottieAnimation(lottiePath: getLottiePath(weatherType)),
        ),
      ),
    );
  }
}

String getLottiePath(PlaceWeatherType weatherType) {
  switch (weatherType) {
    case PlaceWeatherType.sunny:
      return GraphicsFoundation.instance.animations.lottie.sunny.path;
    case PlaceWeatherType.windy:
      return GraphicsFoundation.instance.animations.lottie.windy.path;
    case PlaceWeatherType.rainy:
      return GraphicsFoundation.instance.animations.lottie.rainy.path;
    case PlaceWeatherType.moon:
      return GraphicsFoundation.instance.animations.lottie.moony.path;
  }
}
