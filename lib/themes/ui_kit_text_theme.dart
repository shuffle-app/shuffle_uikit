import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class UiKitTextTheme {}

class UiKitRegularTextTheme extends UiKitTextTheme {
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 12.w,
        fontWeight: FontWeight.w300,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get caption1 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 13.w,
        fontWeight: FontWeight.w300,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get caption2 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 12.w,
        fontWeight: FontWeight.w300,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get body => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16.w,
        fontWeight: FontWeight.w300,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get title1 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 24.w,
        fontWeight: FontWeight.w300,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get title2 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 20.w,
        fontWeight: FontWeight.w300,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 34.w,
        fontWeight: FontWeight.w300,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get caption1UpperCase => caption1;

  TextStyle get subHeadline => body;

  TextStyle get bodyUpperCase => body;
}

class UiKitBoldTextTheme extends UiKitTextTheme {
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16.w,
        fontWeight: FontWeight.w400,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get caption1Medium => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 13.w,
        fontWeight: FontWeight.w400,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get caption1Bold => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 13.w,
        fontWeight: FontWeight.w500,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get caption2Bold => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 12.w,
        fontWeight: FontWeight.w500,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get caption2Medium => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 12.w,
        fontWeight: FontWeight.w400,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get subHeadline => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16.w,
        fontWeight: FontWeight.w600,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get body => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16.w,
        fontWeight: FontWeight.w400,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get title1 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 24.w,
        fontWeight: FontWeight.w600,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get title2 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 20.w,
        fontWeight: FontWeight.w500,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 34.w,
        fontWeight: FontWeight.w600,
        color: const Color(0xffffffff),
        package: 'shuffle_uikit',
      );

  TextStyle get caption1UpperCaseMedium => caption1Medium;

  TextStyle get bodyUpperCase => body;

  TextStyle get caption2UpperCaseMedium => caption2Medium;

  TextStyle get caption1UpperCase => caption1Bold;
}
