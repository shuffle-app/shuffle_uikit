import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GradientFoundation {
  static final walletCardGradient = LinearGradient(
    begin: Alignment(0.5, 1),
    end: Alignment(-1, -1.5),
    colors: [
      Color(0xfF222222).withValues(alpha: 0.66),
      Color(0xff7f7f7f).withValues(alpha: 0.32),
      Color(0xff565656).withValues(alpha: 0.22),
    ],
    stops: [
      0.16,
      0.55,
      0.77,
    ],
  );

  static final lightActivityGradient = LinearGradient(
    colors: [
      ColorsFoundation.pink.withOpacity(0.4),
      ColorsFoundation.pink.withOpacity(0),
      ColorsFoundation.darkBodyTypographyColor.withOpacity(0.1),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const [
      -0.1659,
      0.55,
      0.35,
    ],
  );

  static final blackActivityGradient = LinearGradient(
    colors: [
      ColorsFoundation.pink.withOpacity(0.4),
      ColorsFoundation.pink.withOpacity(0),
      ColorsFoundation.surface1,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const [
      -0.1659,
      0.55,
      0.35,
    ],
  );

  static final showUpGradient = LinearGradient(
    colors: [
      ColorsFoundation.goldGradientBegin,
      ColorsFoundation.yellow,
      ColorsFoundation.goldGradientEnd,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    transform: GradientRotation(-pi / 12),
  );

  static final digestCardGradient = LinearGradient(
    colors: [
      ColorsFoundation.darkNeutral500.withOpacity(0.25),
      ColorsFoundation.shunyGreyGradientEnd.withOpacity(0.12),
      ColorsFoundation.darkNeutral500.withOpacity(0.25),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: const [
      0.1753,
      0.4873,
      0.8003,
    ],
  );

  static const goldGradient = LinearGradient(
    colors: [
      ColorsFoundation.goldGradientBegin,
      ColorsFoundation.goldGradientPreMid,
      ColorsFoundation.goldGradientMid,
      ColorsFoundation.goldGradientEnd,
    ],
    stops: [
      0,
      0.2605,
      0.6277,
      1.0509,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const bronzeGradient = LinearGradient(
    colors: [
      ColorsFoundation.bronzeGradientBegin,
      ColorsFoundation.bronzeGradientPreMid,
      ColorsFoundation.bronzeGradientMid,
      ColorsFoundation.bronzeGradientEnd,
    ],
    stops: [
      0,
      0.3101,
      0.6756,
      1.0509,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const silverGradient = LinearGradient(
    colors: [
      ColorsFoundation.silverGradientBegin,
      ColorsFoundation.silverGradientPreMid,
      ColorsFoundation.silverGradientMid,
      ColorsFoundation.silverGradientEnd,
    ],
    stops: [
      0,
      0.3101,
      0.6277,
      1.0509,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static final updatePageDarkBackgroundGradient = LinearGradient(
    colors: [
      ColorsFoundation.pink.withOpacity(0.25),
      ColorsFoundation.pink.withOpacity(0),
    ],
    stops: const [
      -0.1659,
      0.9961,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final updatePageLightBackgroundGradient = LinearGradient(
    colors: [
      ColorsFoundation.pink.withOpacity(0.05),
      ColorsFoundation.pink.withOpacity(0),
    ],
    stops: const [
      -0.1659,
      0.9961,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const proUserAvatarBorder = LinearGradient(
    colors: [
      ColorsFoundation.proUserAvatarBorder,
      ColorsFoundation.darkNeutral900,
      ColorsFoundation.proUserAvatarBorder,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const shuffleMemberBorder = GradientBoxBorder(
    gradient: LinearGradient(
      colors: [
        ColorsFoundation.memberPlateGradientBegin,
        ColorsFoundation.shufflePlateBorderGradientMid,
        ColorsFoundation.shufflePlateBorderGradientEnd,
      ],
      stops: [
        0.0298,
        0.4472,
        0.9895,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  static const shuffleMemberPlate = LinearGradient(
    colors: [
      ColorsFoundation.memberPlateGradientBegin,
      Colors.white,
      Colors.white,
      ColorsFoundation.memberPlateGradientMid,
      ColorsFoundation.shufflePlateGradientEnd,
    ],
    stops: [
      0.0408,
      0.2369,
      0.4833,
      0.7775,
      0.9592,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const memberPlate = LinearGradient(
    colors: [
      ColorsFoundation.memberPlateGradientBegin,
      Colors.white,
      Colors.white,
      ColorsFoundation.memberPlateGradientMid,
      ColorsFoundation.memberPlateGradientEnd,
    ],
    stops: [
      0.0408,
      0.2369,
      0.4833,
      0.5978,
      0.9592,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const diamondGradient = RadialGradient(
    stops: [
      0,
      0.473,
      1,
    ],
    focal: Alignment(0.0736, 0.1631),
    colors: [
      ColorsFoundation.orange,
      ColorsFoundation.yellow,
      ColorsFoundation.pink,
    ],
  );

  // background: linear-gradient(87deg, #E3E3E3 -0.53%, #999 21.1%, #CDCDCD 42.73%, #999 61.19%, #CDCDCD 80.7%, #999 100.75%);

  static const darkGreyGradient = LinearGradient(
    transform: GradientRotation(-pi / 12),
    stops: [
      0,
      0.211,
      0.4271,
      0.6094,
      0.821,
      1,
    ],
    colors: [
      ColorsFoundation.gradientGreyDark1,
      ColorsFoundation.gradientGreyDark2,
      ColorsFoundation.gradientGreyDark3,
      ColorsFoundation.gradientGreyDark2,
      ColorsFoundation.gradientGreyDark3,
      ColorsFoundation.gradientGreyDark2,
    ],
  );

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

  // background: linear-gradient(121.73deg, #E23301 -34.73%, #000000 48.62%, #D52DD3 153.72%);

  static const adBannerGradient = LinearGradient(
    colors: [
      ColorsFoundation.pink,
      ColorsFoundation.error,
      ColorsFoundation.yellow,
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    transform: GradientRotation(-pi / 12),
    stops: [
      0.3473,
      0.4862,
      1.5372,
    ],
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

  static final defaultLinearGradientWithOpacity02 = LinearGradient(
    colors: [
      ColorsFoundation.pink.withOpacity(0.2),
      ColorsFoundation.yellow.withOpacity(0.2),
      ColorsFoundation.error.withOpacity(0.2),
    ],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    transform: const GradientRotation(pi / 7),
  );

  static const fameLinearGradient = LinearGradient(
    colors: [
      ColorsFoundation.pink,
      ColorsFoundation.yellow,
      ColorsFoundation.error,
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    // transform: GradientRotation(pi / 12),
  );

  static const starLinearGradient = LinearGradient(
    colors: [
      ColorsFoundation.pink,
      ColorsFoundation.error,
      ColorsFoundation.yellow,
    ],
    stops: [0.3, 0.55, 0.7],

    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    // transform: GradientRotation(pi / 12),
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

  static const premiumLinearGradient = LinearGradient(
    colors: [
      ColorsFoundation.yellow,
      ColorsFoundation.error,
      ColorsFoundation.pink,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.1, 0.6, 0.95],
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

  static const sendMessageButtonRadialGradient = RadialGradient(
    colors: [
      ColorsFoundation.orange,
      ColorsFoundation.yellow,
      ColorsFoundation.pink,
    ],
    radius: 1.8,
    center: Alignment(-1.5, -0.75),
    stops: [
      0.203,
      0.5,
      0.799,
    ],
  );

  static const gradientBorder = GradientBoxBorder(
    gradient: defaultRadialGradient,
    width: 2,
  );

  static const updatePageGradientRings = GradientBoxBorder(
    gradient: touchIdLinearGradient,
    width: 3,
  );

  static const touchIdgradientBorder = GradientBoxBorder(
    gradient: touchIdLinearGradient,
    width: 1,
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

  static const lightSurfaceLinearGradient = LinearGradient(
    colors: [
      ColorsFoundation.lightSurfaceGradientBegin,
      ColorsFoundation.lightSurfaceGradientMid,
      ColorsFoundation.lightSurfaceGradientEnd,
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

  static const lightSurfaceGradient = LinearGradient(
    colors: [
      ColorsFoundation.lightSurfaceGradientEnd,
      ColorsFoundation.lightSurfaceGradientBegin,
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

  static const blackLinearGradientInverted = LinearGradient(
    colors: [
      Colors.black,
      Colors.transparent,
    ],
    stops: [
      0,
      0.8563,
    ],
    end: Alignment.bottomCenter,
    begin: Alignment.topCenter,
  );

  static const whiteLinearGradient = LinearGradient(
    colors: [
      // Colors.transparent,
      Colors.white10,
      Colors.white24,
      Colors.white54,
      Colors.white70,
      Colors.white,
    ],
    stops: [
      0,
      // 0.1,
      0.3,
      0.5,
      0.6,
      0.9,
    ],
    end: Alignment.bottomCenter,
    begin: Alignment.topCenter,
  );
  static const whiteLinearInvertedGradient = LinearGradient(
    colors: [
      // Colors.transparent,
      Colors.white,
      Colors.white70,
      Colors.white54,
      Colors.white30,
    ],
    stops: [
      0,
      // 0.1,
      0.3,
      0.5,
      0.9,
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

  static final blueLinearGradient = LinearGradient(
    colors: [
      ColorsFoundation.weatherBlue.withOpacity(0.1),
      ColorsFoundation.weatherBlue.withOpacity(0.031),
    ],
    stops: const [
      1,
      0,
    ],
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

  static const lightShunyGreyGradient = LinearGradient(
    colors: [
      ColorsFoundation.lightSurface1,
      Colors.white,
      ColorsFoundation.lightSurface1,
    ],
    stops: [
      0.1753,
      0.4873,
      0.8003,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final shunyGreyGradient = LinearGradient(
    colors: [
      ColorsFoundation.shunyGreyGradientBegin.withOpacity(0.66),
      ColorsFoundation.shunyGreyGradientMid.withOpacity(0.32),
      ColorsFoundation.shunyGreyGradientEnd.withOpacity(0.12),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [
      0.1753,
      0.4873,
      0.8003,
    ],
  );
  static final shunyGreyGradientInverted = LinearGradient(
    colors: [
      ColorsFoundation.shunyGreyGradientMid.withOpacity(0.32),
      ColorsFoundation.shunyGreyGradientEnd.withOpacity(0.12),
      ColorsFoundation.shunyGreyGradientMid.withOpacity(0.32),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: const [
      0.1753,
      0.4873,
      0.8003,
    ],
  );

  // background: linear-gradient(140.85deg, rgba(34, 34, 34, 0.66) 17.53%, rgba(127, 127, 127, 0.32) 48.73%, rgba(86, 86, 86, 0.22) 80.09%);

  static final companySubscriptionGradient = LinearGradient(
    colors: [
      ColorsFoundation.shunyGreyGradientBegin.withOpacity(0.66),
      ColorsFoundation.shunyGreyGradientMid.withOpacity(0.32),
      ColorsFoundation.shunyGreyGradientEnd.withOpacity(0.22),
    ],
    stops: const [
      0.1753,
      0.4873,
      0.8003,
    ],
    transform: const GradientRotation((-3 * pi) / 4),
  );

  GradientFoundation._();
}

// radial-gradient(240.53% 266.28% at 7.36% 16.31%, #E32900 0%, #C6E216 47.3%, #D808FA 100%) // border gradient
// radial-gradient(112.31% 397% at 55.96% -99%, #E32900 0%, #C6E216 60.17%, #D808FA 100%) // button gradient
