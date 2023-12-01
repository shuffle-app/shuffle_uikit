import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class UiKitTextTheme {}

class UiKitRegularTextTheme extends UiKitTextTheme {
  final Color foregroundColor;

  TextStyle get caption4 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 8.w,
        fontWeight: FontWeight.w300,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get caption4Regular => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 9.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 12.w,
        fontWeight: FontWeight.w300,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get caption1 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 13.w,
        fontWeight: FontWeight.w300,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get caption2 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 12.w,
        fontWeight: FontWeight.w300,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get body => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16.w,
        fontWeight: FontWeight.w300,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16.w,
        fontWeight: FontWeight.w200,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get title1 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 24.w,
        fontWeight: FontWeight.w300,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get title2 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 20.w,
        fontWeight: FontWeight.w300,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 34.w,
        fontWeight: FontWeight.w300,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get caption1UpperCase => caption1;

  TextStyle get subHeadline => body;

  TextStyle get bodyUpperCase => body;

  UiKitRegularTextTheme({this.foregroundColor = const Color(0xffffffff)});
}

class UiKitBoldTextTheme extends UiKitTextTheme {
  final Color foregroundColor;

  TextStyle get caption3Medium => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 10.w,
        fontWeight: FontWeight.w500,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get caption1Medium => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 13.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get caption1Bold => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 13.w,
        fontWeight: FontWeight.w500,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get caption2Bold => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 12.w,
        fontWeight: FontWeight.w500,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get caption2Medium => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 12.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get subHeadline => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16.w,
        fontWeight: FontWeight.w600,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get body => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16.w,
        fontWeight: FontWeight.w400,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get title1 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 24.w,
        fontWeight: FontWeight.w600,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get title2 => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 20.w,
        fontWeight: FontWeight.w500,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 34.w,
        fontWeight: FontWeight.w600,
        color: foregroundColor,
        package: 'shuffle_uikit',
      );

  TextStyle get caption1UpperCaseMedium => caption1Medium;

  TextStyle get bodyUpperCase => body;

  TextStyle get caption2UpperCaseMedium => caption2Medium;

  TextStyle get caption1UpperCase => caption1Bold;

  UiKitBoldTextTheme({this.foregroundColor = const Color(0xffffffff)});
}
