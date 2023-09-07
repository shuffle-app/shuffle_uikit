import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GradientFoundation {
  static const greyGradient = LinearGradient(
    colors: [
      Colors.white,
      ColorsFoundation.gradientGreyLight1,
      Colors.white,
      ColorsFoundation.gradientGreyLight2,
      Colors.white,
      ColorsFoundation.gradientGreyLight3,
    ],
    stops: [
      0,
      0.2135,
      0.4271,
      0.6094,
      0.821,
      1,
    ],
    transform: GradientRotation(-pi / 12),
  );

  static const badgeIcon = LinearGradient(
    colors: [
      ColorsFoundation.pink,
      ColorsFoundation.orange,
      ColorsFoundation.yellow,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    transform: GradientRotation(-pi / 12),
  );

  static const attentionCard = LinearGradient(
    colors: [
      ColorsFoundation.error,
      ColorsFoundation.yellow,
      ColorsFoundation.pink,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    transform: GradientRotation(-pi / 12),
  );

  static const touchIdLinearGradient = LinearGradient(
    colors: [
      ColorsFoundation.pink,
      ColorsFoundation.yellow,
      ColorsFoundation.error,
    ],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    transform: GradientRotation(pi / 6),
  );

  static const defaultLinearGradient = LinearGradient(
    colors: [
      ColorsFoundation.pink,
      ColorsFoundation.yellow,
      ColorsFoundation.error,
    ],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    transform: GradientRotation(pi / 6),
  );

  static const donationLinearGradient = LinearGradient(
    colors: [
      ColorsFoundation.yellow,
      ColorsFoundation.orange,
    ],
    begin: Alignment.centerRight,
    end: Alignment.bottomLeft,
    stops: [
      0.4,
      1,
    ],
    transform: GradientRotation(pi / 6),
  );

  static const buttonGradientLinear = LinearGradient(
    colors: [
      ColorsFoundation.error,
      ColorsFoundation.yellow,
      ColorsFoundation.pink,
    ],
    end: Alignment.bottomLeft,
    begin: Alignment.topRight,
    transform: GradientRotation(-pi / 12),
  );

  static const defaultRadialGradient = RadialGradient(
    colors: [
      ColorsFoundation.orange,
      ColorsFoundation.yellow,
      ColorsFoundation.pink,
    ],
    radius: 2,
    center: Alignment(-0.6, -0.9),
    stops: [
      0,
      0.203,
      1,
    ],
  );

  static const gradientBorder = GradientBoxBorder(
    gradient: defaultRadialGradient,
    width: 2,
  );

  static const touchIdgradientBorder = GradientBoxBorder(
    gradient: touchIdLinearGradient,
    width: 2,
  );

  // radial-gradient(112.31% 397% at 55.96% -99%, #E32900 0%, #C6E216 60.17%, #D808FA 100%)
  static const buttonGradient = RadialGradient(
    center: Alignment(0.6, -1),
    radius: 10,
    colors: [
      ColorsFoundation.orange,
      ColorsFoundation.yellow,
      ColorsFoundation.pink,
    ],
    transform: GradientRotation(-0.75),
    stops: [
      0,
      0.3017,
      0.5,
    ],
  );

  static const weatherOffState = LinearGradient(
    colors: [
      ColorsFoundation.surface2,
      ColorsFoundation.darkNeutral900,
    ],
    // stops: [
    //   0,
    //   0.9563,
    // ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const surfaceLinearGradient = LinearGradient(
    colors: [
      ColorsFoundation.surfaceGradientBegin,
      ColorsFoundation.surfaceGradientMid,
      ColorsFoundation.surfaceGradientEnd,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const darkSurfaceGradient = LinearGradient(
    colors: [
      ColorsFoundation.surface5,
      ColorsFoundation.surface3,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const solidSurfaceLinearGradient = LinearGradient(
    colors: [
      UiKitColors.surface,
      Colors.transparent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const blackLinearGradient = LinearGradient(
    colors: [
      Colors.transparent,
      Colors.black,
    ],
    stops: [
      0,
      0.9563,
    ],
    end: Alignment.bottomCenter,
    begin: Alignment.topCenter,
  );
  static const findSomeoneGradient = RadialGradient(
    center: Alignment(1.1, 1.0),
    focal: Alignment(1.1, 1.0),
    radius: 8,
    colors: [
      ColorsFoundation.yellow,
      ColorsFoundation.orange,
      ColorsFoundation.pink,
    ],
    stops: [0.2, 0.8, 1.0],
  );

  static final yellowLinearGradient = LinearGradient(
    colors: [
      ColorsFoundation.weatherYellow.withOpacity(0.1),
      ColorsFoundation.weatherYellow.withOpacity(0.031),
    ],
    stops: const [
      1,
      0,
    ],
  );

  GradientFoundation._();
}

// radial-gradient(240.53% 266.28% at 7.36% 16.31%, #E32900 0%, #C6E216 47.3%, #D808FA 100%) // border gradient
// radial-gradient(112.31% 397% at 55.96% -99%, #E32900 0%, #C6E216 60.17%, #D808FA 100%) // button gradient
