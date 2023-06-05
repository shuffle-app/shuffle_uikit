import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  final String lottiePath;

  const LottieAnimation({
    super.key,
    required this.lottiePath,
  });

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      lottiePath,
      repeat: true,
      fit: BoxFit.cover,
      animate: true,
      package: 'shuffle_uikit',
    );
  }
}
