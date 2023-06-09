import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class UiKitTextTheme {}

class UiKitRegularTextTheme extends UiKitTextTheme {
  final TextStyle labelSmall = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 12.w,
    fontWeight: FontWeight.w300,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  final TextStyle caption1 = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 13.w,
    fontWeight: FontWeight.w300,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  final TextStyle caption2 = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 12.w,
    fontWeight: FontWeight.w300,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  final TextStyle body = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 16.w,
    fontWeight: FontWeight.w300,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  final TextStyle title1 = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 24.w,
    fontWeight: FontWeight.w300,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  final TextStyle title2 = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 20.w,
    fontWeight: FontWeight.w300,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  final TextStyle titleLarge = TextStyle(
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
  final TextStyle labelLarge = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 16.w,
    fontWeight: FontWeight.w400,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  final TextStyle caption1Medium = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 13.w,
    fontWeight: FontWeight.w400,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  final TextStyle caption1Bold = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 13.w,
    fontWeight: FontWeight.w500,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  final TextStyle caption2Bold = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 12.w,
    fontWeight: FontWeight.w500,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  final TextStyle caption2Medium = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 12.w,
    fontWeight: FontWeight.w400,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  final TextStyle subHeadline = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 16.w,
    fontWeight: FontWeight.w600,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  final TextStyle body = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 16.w,
    fontWeight: FontWeight.w400,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  final TextStyle title1 = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 24.w,
    fontWeight: FontWeight.w600,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  final TextStyle title2 = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 20.w,
    fontWeight: FontWeight.w500,
    color: const Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  final TextStyle titleLarge = TextStyle(
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
