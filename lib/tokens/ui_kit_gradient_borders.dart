import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/tokens/ui_kit_colors.dart';

class UiKitGradientBorders {
  UiKitGradientBorders._();

  static const gradientDefault = GradientBoxBorder(
    gradient: RadialGradient(
      colors: [
        UiKitColors.chipBorderOrange,
        UiKitColors.chipBorderYellow,
        UiKitColors.chipBorderPink,
      ],
      radius: 2,
      center: Alignment(-0.6, -0.9),
      stops: [
        0,
        0.473,
        1,
      ],
    ),
    width: 2,
  );
}

// radial-gradient(240.53% 266.28% at 7.36% 16.31%, #E32900 0%, #C6E216 47.3%, #D808FA 100%
