import 'package:flutter/painting.dart';

class UiKitRegularTextTheme {
  final TextStyle labelSmall = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  final TextStyle caption1 = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 13,
    fontWeight: FontWeight.w300,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  TextStyle get caption1UpperCase => caption1;
  final TextStyle caption2 = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  TextStyle get subHeadline => body;
  final TextStyle body = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  TextStyle get bodyUpperCase => body;
  final TextStyle title1 = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 24,
    fontWeight: FontWeight.w300,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  final TextStyle title2 = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  final TextStyle titleLarge = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 34,
    fontWeight: FontWeight.w300,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
}

class UiKitBoldTextTheme {
  final TextStyle labelLarge = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  final TextStyle caption1Medium = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  TextStyle get caption1UpperCaseMedium => caption1Medium;
  TextStyle get caption1UpperCase => caption1Bold;
  final TextStyle caption1Bold = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  final TextStyle caption2Bold = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  final TextStyle caption2Medium = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  TextStyle get caption2UpperCaseMedium => caption2Medium;
  final TextStyle subHeadline = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  final TextStyle body = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  TextStyle get bodyUpperCase => body;
  final TextStyle title1 = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  final TextStyle title2 = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
  final TextStyle titleLarge = const TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 34,
    fontWeight: FontWeight.w600,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );
}
