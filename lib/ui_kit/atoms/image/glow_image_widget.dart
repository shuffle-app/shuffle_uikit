import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GlowShadowWidget extends StatelessWidget {
  final ImageWidget child;

  const GlowShadowWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final isDarkMode = theme?.colorScheme.surface == const UiKitColorScheme.dark().surface;
    final shadowColor = (isDarkMode ? UiKitColors.yellowDarkShadow : UiKitColors.yellowBrightShadow);
    const opacity = 0.75;
    const scaleFactor = 1.1;

    return Transform.scale(
      scale: scaleFactor,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaY: 1.2, sigmaX: 1.2, tileMode: TileMode.decal),
        child: Opacity(
          opacity: opacity,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(shadowColor, BlendMode.srcATop),
            child: child,
          ),
        ),
      ),
    );
  }
}
