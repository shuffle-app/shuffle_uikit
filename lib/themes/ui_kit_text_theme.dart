import 'dart:ui';

class UiKitRegularTextTheme {
  final TextStyle labelSmall = TextStyle(
    fontFamily: 'Syne',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 17.5,
    color: const Color(0xff000000),
  );
  final TextStyle caption1 = TextStyle(
    fontFamily: 'Syne',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 16.25,
    color: const Color(0xff000000),
  );
  TextStyle get caption1UpperCase => caption1;
  final TextStyle caption2 = TextStyle(
    fontFamily: 'Syne',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 15.6,
    color: const Color(0xff000000),
  );
  TextStyle get subHeadline => body;
  final TextStyle body = TextStyle(
    fontFamily: 'Syne',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 20,
    color: const Color(0xff000000),
  );
  TextStyle get bodyUpperCase => body;
  final TextStyle title1 = TextStyle(
    fontFamily: 'Syne',
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 26.4,
    color: const Color(0xff000000),
  );
  final TextStyle title2 = TextStyle(
    fontFamily: 'Syne',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 22,
    color: const Color(0xff000000),
  );

  final TextStyle titleLarge = TextStyle(
    fontFamily: 'Syne',
    fontSize: 34,
    fontWeight: FontWeight.w400,
    height: 37,
    color: const Color(0xff000000),
  );
}

class UiKitBoldTextTheme {
  final TextStyle labelLarge = TextStyle(
    fontFamily: 'Syne',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 20,
    color: const Color(0xff000000),
  );

  final TextStyle caption1Medium = TextStyle(
    fontFamily: 'Syne',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 16.25,
    color: const Color(0xff000000),
  );
  TextStyle get caption1UpperCaseMedium => caption1Medium;
  TextStyle get caption1UpperCase => caption1;
  final TextStyle caption1 = TextStyle(
    fontFamily: 'Syne',
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 16.25,
    color: const Color(0xff000000),
  );
  final TextStyle caption2 = TextStyle(
    fontFamily: 'Syne',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 15.6,
    color: const Color(0xff000000),
  );
  final TextStyle subHeadline = TextStyle(
    fontFamily: 'Syne',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 20,
    color: const Color(0xff000000),
  );
  final TextStyle body = TextStyle(
    fontFamily: 'Syne',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 20,
    color: const Color(0xff000000),
  );
  TextStyle get bodyUpperCase => body;
  final TextStyle title1 = TextStyle(
    fontFamily: 'Syne',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 26.4,
    color: const Color(0xff000000),
  );

  final TextStyle title2 = TextStyle(
    fontFamily: 'Syne',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 22,
    color: const Color(0xff000000),
  );
  final TextStyle titleLarge = TextStyle(
    fontFamily: 'Syne',
    fontSize: 34,
    fontWeight: FontWeight.w700,
    height: 37.4,
    color: const Color(0xff000000),
  );
}
