import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  final String lottiePath;
  final Animation<double>? controller;

  const LottieAnimation({
    super.key,
    required this.lottiePath,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      lottiePath,
      repeat: true,
      fit: BoxFit.cover,
      animate: true,
      controller: controller,
      package: 'shuffle_uikit',
    );
  }
}
