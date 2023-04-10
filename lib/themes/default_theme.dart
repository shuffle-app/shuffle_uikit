import 'package:flutter/material.dart';
import 'package:shuffle_uikit/themes/ui_kit_text_theme.dart';
import 'package:shuffle_uikit/themes/ui_kit_theme_data.dart';

import '../foundation/shuffle_ui_kit_foundation.dart';

class UiKitThemes {
  final defaultThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    useMaterial3: false,
    extensions: <ThemeExtension<UiKitThemeData>>[
      UiKitThemeData(
        customColor: Colors.red,
        iconInputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.07),
          border: const OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: BorderSide.none,
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: BorderSide.none,
          ),
          errorStyle: const TextStyle(
            package: 'shuffle_uikit',
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
          errorMaxLines: 1,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          hintStyle: const TextStyle(
            package: 'shuffle_uikit',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
          labelStyle: const TextStyle(
            package: 'shuffle_uikit',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
          helperStyle: const TextStyle(
            package: 'shuffle_uikit',
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
          prefixStyle: const TextStyle(
            package: 'shuffle_uikit',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
          suffixStyle: const TextStyle(
            package: 'shuffle_uikit',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
        ),
        noIconInputTheme: InputDecorationTheme(),
        noFillInputTheme: InputDecorationTheme(),
        customAppBapTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
            package: 'shuffle_uikit',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
          toolbarHeight: 84,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white.withOpacity(0.07),
          foregroundColor: Colors.white.withOpacity(0.07),
          centerTitle: true,
        ),
        uiKitTabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          unselectedLabelStyle: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
          labelStyle: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          indicator: BoxDecoration(
            borderRadius: BorderRadiusFoundation.max,
            color: Colors.white,
          ),
        ),
        cardColor: ColorsFoundation.solidSurface,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.max,
          ),
        ),
        cardTheme: const CardTheme(
          shadowColor: Colors.transparent,
          surfaceTintColor: ColorsFoundation.solidSurface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.all24,
          ),
        ),
        boldTextTheme: UiKitBoldTextTheme(),
        regularTextTheme: UiKitRegularTextTheme(),
      ),
    ],
  );
}
