import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';

class GradientFoundation {
  GradientFoundation._();

  static const defaultGradient = GradientBoxBorder(
    gradient: RadialGradient(
      colors: [
        ColorsFoundation.orange,
        ColorsFoundation.yellow,
        ColorsFoundation.pink,
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

  static const buttonGradient = RadialGradient(
    center: Alignment(-0.5596, 0.99),
    radius: 8,
    colors: [
      ColorsFoundation.pink,
      ColorsFoundation.yellow,
      ColorsFoundation.orange,
      ColorsFoundation.yellow,
    ],
    transform: GradientRotation(1),
    stops: [
      0,
      0.3017,
      0.6,
      1,
    ],
  );
}

// radial-gradient(240.53% 266.28% at 7.36% 16.31%, #E32900 0%, #C6E216 47.3%, #D808FA 100%) // border gradient
// radial-gradient(112.31% 397% at 55.96% -99%, #E32900 0%, #C6E216 60.17%, #D808FA 100%) // button gradient
