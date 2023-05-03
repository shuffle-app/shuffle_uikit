import 'package:flutter/material.dart';
import 'package:shuffle_uikit/themes/bottom_sheet_theme.dart';
import 'package:shuffle_uikit/themes/ui_kit_text_theme.dart';
import 'package:shuffle_uikit/themes/ui_kit_theme_data.dart';

import '../foundation/shuffle_ui_kit_foundation.dart';

class UiKitThemes {
  late final defaultThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    useMaterial3: false,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      enableFeedback: true,
    ),
    disabledColor: ColorsFoundation.darkNeutral300,
    extensions: <ThemeExtension<UiKitThemeData>>[
      UiKitThemeData(
        customColor: Colors.red,
        chipTheme: UiKitChipThemeData(
          border: Border.all(color: Colors.white, width: 2),
          backgroundColor: ColorsFoundation.solidSurface,
        ),
        blurredBottomNavigationBarTheme: BlurredBottomNavigationBarTheme(
          iconColors: Colors.white,
        ),
        ordinaryButtonStyle: ButtonStyle(
          fixedSize: MaterialStateProperty.resolveWith((states) => const Size.fromHeight(48)),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorsFoundation.darkNeutral300;
            } else {
              return Colors.white;
            }
          }),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
          ),
          foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
        ),
        smallOrdinaryButtonStyle: ButtonStyle(
          fixedSize: MaterialStateProperty.resolveWith((states) => const Size.fromHeight(28)),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorsFoundation.darkNeutral300;
            } else {
              return Colors.white;
            }
          }),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
          ),
          foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
        ),
        iconInputTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorsFoundation.solidSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
        ),
        noIconInputTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorsFoundation.solidSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all24,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
        ),
        noFillInputTheme: const InputDecorationTheme(
          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0.5)),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0.5)),
          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorsFoundation.error, width: 0.5)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0.5)),
          focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorsFoundation.error, width: 0.5)),
          disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorsFoundation.darkNeutral900, width: 0.5)),
        ),
        customAppBapTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: ColorsFoundation.surface),
          toolbarHeight: 84,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white.withOpacity(0.07),
          centerTitle: true,
        ),
        uiKitTabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          indicator: BoxDecoration(
            borderRadius: BorderRadiusFoundation.max,
            color: Colors.white,
          ),
        ),
        cardColor: ColorsFoundation.solidSurface,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.max,
          ),
        ),
        cardTheme: CardTheme(
          shadowColor: Colors.transparent,
          surfaceTintColor: ColorsFoundation.solidSurface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.all24,
          ),
        ),
        boldTextTheme: UiKitBoldTextTheme(),
        regularTextTheme: UiKitRegularTextTheme(),
        bottomSheetTheme: UiKitBottomSheetThemeData(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.onlyTop40,
          ),
          sheetSliderColor: ColorsFoundation.darkNeutral500,
        ),
      ),
    ],
  );

  final fallbackThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryTextTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xffffffff),
        package: 'shuffle_uikit',
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xffffffff),
        package: 'shuffle_uikit',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith((states) => const Size.fromHeight(48)),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorsFoundation.darkNeutral300;
          } else {
            return Colors.white;
          }
        }),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
        ),
        foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.white;
          }
          return ColorsFoundation.darkNeutral300;
        }),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.white,
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      indicator: BoxDecoration(
        borderRadius: BorderRadiusFoundation.max,
        color: Colors.white,
      ),
    ),
    cardColor: ColorsFoundation.surface,
    appBarTheme: AppBarTheme(
      toolbarHeight: 84,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.black.withOpacity(0.07),
      centerTitle: true,
    ),
  );
}
