import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';

class UiKitColorScheme extends ColorScheme {
  final Color surface1;
  final Color surface2;
  final Color surface3;
  final Color surface4;
  final Color surface5;
  final Color uiPrimary;
  final Color darkNeutral100 = ColorsFoundation.darkNeutral100;
  final Color darkNeutral200 = ColorsFoundation.darkNeutral200;
  final Color darkNeutral300 = ColorsFoundation.darkNeutral300;
  final Color darkNeutral400 = ColorsFoundation.darkNeutral400;
  final Color darkNeutral500 = ColorsFoundation.darkNeutral500;
  final Color darkNeutral600 = ColorsFoundation.darkNeutral600;
  final Color darkNeutral800 = ColorsFoundation.darkNeutral800;
  final Color darkNeutral900 = ColorsFoundation.darkNeutral900;
  final Color grayForegroundColor;
  final Color info = ColorsFoundation.info;
  final Color bodyTypography;
  final Color inverseBodyTypography;
  final Color headingTypography;
  final Color inverseHeadingTypography;

  @override
  final Color inversePrimary;

  const UiKitColorScheme.light({
    this.surface1 = ColorsFoundation.lightSurface1,
    this.surface2 = ColorsFoundation.lightSurface2,
    this.surface3 = ColorsFoundation.lightSurface3,
    this.surface4 = ColorsFoundation.lightSurface4,
    this.surface5 = ColorsFoundation.lightSurface5,
    this.uiPrimary = ColorsFoundation.solidLightSurface,
    this.inversePrimary = ColorsFoundation.solidSurface,
    this.grayForegroundColor = ColorsFoundation.darkNeutral300,
    this.bodyTypography = ColorsFoundation.lightBodyTypographyColor,
    this.inverseBodyTypography = ColorsFoundation.darkBodyTypographyColor,
    this.headingTypography = ColorsFoundation.lightHeadingTypographyColor,
    this.inverseHeadingTypography = ColorsFoundation.darkHeadingTypographyColor,
    super.surface = ColorsFoundation.lightSurface,
  }) : super.light(primary: uiPrimary, inversePrimary: inversePrimary);

  const UiKitColorScheme.dark({
    this.surface1 = ColorsFoundation.surface1,
    this.surface2 = ColorsFoundation.surface2,
    this.surface3 = ColorsFoundation.surface3,
    this.surface4 = ColorsFoundation.surface5,
    this.surface5 = ColorsFoundation.surface5,
    this.uiPrimary = ColorsFoundation.solidSurface,
    this.inversePrimary = ColorsFoundation.solidLightSurface,
    this.grayForegroundColor = ColorsFoundation.darkNeutral100,
    this.bodyTypography = ColorsFoundation.darkBodyTypographyColor,
    this.inverseBodyTypography = ColorsFoundation.lightBodyTypographyColor,
    this.headingTypography = ColorsFoundation.darkHeadingTypographyColor,
    this.inverseHeadingTypography = ColorsFoundation.lightHeadingTypographyColor,
    super.surface = ColorsFoundation.surface,
  }) : super.dark(primary: uiPrimary, inversePrimary: inversePrimary);
}
