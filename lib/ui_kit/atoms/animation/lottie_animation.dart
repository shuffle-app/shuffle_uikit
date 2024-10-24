import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  final String lottiePath;
  final Animation<double>? controller;
  final BoxFit? fit;

  const LottieAnimation({
    super.key,
    required this.lottiePath,
    this.controller,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      lottiePath,
      repeat: true,
      fit: fit ?? BoxFit.cover,
      animate: true,
      controller: controller,
      package: 'shuffle_uikit',
    );
  }
}
