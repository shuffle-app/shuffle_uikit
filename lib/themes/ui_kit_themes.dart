import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitThemes {
  static const _pickerTextStyle = TextStyle(
    fontFamily: 'Unbounded',
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Color(0xffffffff),
    package: 'shuffle_uikit',
  );

  late final lightThemeData = defaultThemeData.copyWith(
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.black,
      textStyle: TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Color(0xffffffff),
        package: 'shuffle_uikit',
      ),
    ),
    scaffoldBackgroundColor: ColorsFoundation.lightSurface,
    iconTheme: const IconThemeData(color: ColorsFoundation.solidLightSurface),
    colorScheme: ColorScheme.fromSeed(seedColor: UiKitColors.deepPurple, onSurface: Colors.black),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: const TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16,
        fontWeight: FontWeight.w300,
        // color: Color(0xffffffff),
        // color: Color(0xFF000000),
        package: 'shuffle_uikit',
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) => UiKitColors.lightSurface),
// elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: UiKitColors.lightSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadiusFoundation.all16,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadiusFoundation.all16,
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadiusFoundation.all16,
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadiusFoundation.all16,
          borderSide: const BorderSide(
            color: ColorsFoundation.error,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadiusFoundation.all16,
          borderSide: const BorderSide(
            color: ColorsFoundation.error,
            width: 2,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((_) => ColorsFoundation.solidLightSurface),
        foregroundColor: WidgetStateProperty.resolveWith((_) => ColorsFoundation.solidSurface),
        overlayColor: WidgetStateProperty.resolveWith((_) => Colors.transparent),
        textStyle: WidgetStateTextStyle.resolveWith((_) {
          return const TextStyle(
            fontFamily: 'Unbounded',
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
            package: 'shuffle_uikit',
            overflow: TextOverflow.ellipsis,
          );
        }),
      ),
    ),
    timePickerTheme: defaultThemeData.timePickerTheme.copyWith(
      helpTextStyle: _pickerTextStyle.copyWith(fontSize: 16, color: Colors.black),
      backgroundColor: UiKitColors.lightSurface4,
      entryModeIconColor: Colors.black,
      dialTextColor: Colors.black,
      dayPeriodTextColor: Colors.black,
    ),
    datePickerTheme: defaultThemeData.datePickerTheme.copyWith(
      headerForegroundColor: Colors.white,
      rangeSelectionOverlayColor: WidgetStateProperty.resolveWith((states) => Colors.white),
      rangeSelectionBackgroundColor: ColorsFoundation.darkNeutral500.withOpacity(0.24),
      dayForegroundColor: WidgetStateProperty.resolveWith((states) => Colors.black),
      yearForegroundColor: WidgetStateProperty.resolveWith((states) => Colors.black),
      surfaceTintColor: ColorsFoundation.deepPurple,
      rangePickerHeaderHelpStyle: _pickerTextStyle.copyWith(color: Colors.black),
      yearStyle: _pickerTextStyle.copyWith(color: Colors.black),
      headerHelpStyle: _pickerTextStyle.copyWith(color: Colors.black),
      rangePickerHeaderHeadlineStyle: _pickerTextStyle.copyWith(color: Colors.white),
      rangePickerShape: const CircleBorder(side: BorderSide(color: Colors.black, width: 1)),
      weekdayStyle: _pickerTextStyle.copyWith(color: ColorsFoundation.darkNeutral900),
      headerHeadlineStyle: _pickerTextStyle.copyWith(color: Colors.black),
      dayStyle: _pickerTextStyle.copyWith(color: Colors.black, fontSize: 16),
    ),
    extensions: [
      UiKitThemeData(
        themeMode: ThemeMode.light,
        colorScheme: const UiKitColorScheme.light(),
        cardColor: ColorsFoundation.lightSurface2,
        customColor: Colors.red,
        chipTheme: UiKitChipThemeData(
          border: Border.all(color: ColorsFoundation.solidSurface, width: 2),
          backgroundColor: ColorsFoundation.solidLightSurface,
        ),
        blurredBottomNavigationBarTheme: BlurredBottomNavigationBarTheme(
          iconColors: Colors.black,
        ),
        ordinaryButtonStyle: ButtonStyle(
          fixedSize: WidgetStateProperty.resolveWith(
            (states) => const Size.fromHeight(48),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.disabled) ? ColorsFoundation.darkNeutral300 : Colors.white;
          }),
          shape: WidgetStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
          ),
          overlayColor: WidgetStateProperty.resolveWith((_) {
            return ColorsFoundation.darkNeutral900;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((_) => Colors.white),
        ),
        smallOrdinaryButtonStyle: ButtonStyle(
          fixedSize: WidgetStateProperty.resolveWith((states) => const Size.fromHeight(28)),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.disabled) ? ColorsFoundation.darkNeutral300 : Colors.white;
          }),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            return ColorsFoundation.darkNeutral900;
          }),
          shape: WidgetStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
          ),
          foregroundColor: WidgetStateProperty.resolveWith((_) => Colors.white),
        ),
        iconInputTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorsFoundation.solidLightSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: ColorsFoundation.solidLightSurface,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
        ),
        noIconInputTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorsFoundation.solidLightSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
        ),
        noIconInputBorderRadius20: InputDecorationTheme(
          filled: true,
          fillColor: ColorsFoundation.solidSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all20,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all20,
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all20,
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all20,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all20,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
        ),
        noFillInputTheme: const InputDecorationTheme(
          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 0.5)),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 0.5)),
          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorsFoundation.error, width: 0.5)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 0.5)),
          focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorsFoundation.error, width: 0.5)),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsFoundation.darkNeutral900, width: 0.5),
          ),
        ),
        customAppBapTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: ColorsFoundation.solidSurface,
          ),
          toolbarHeight: 84,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white.withOpacity(0.07),
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        uiKitTabBarTheme: TabBarThemeData(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: ColorsFoundation.lightSurface,
          unselectedLabelColor: ColorsFoundation.lightHeadingTypographyColor,
          indicator: BoxDecoration(
            borderRadius: BorderRadiusFoundation.max,
            color: ColorsFoundation.surface,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.max,
          ),
        ),
        cardTheme: CardThemeData(
          shadowColor: Colors.transparent,
          surfaceTintColor: ColorsFoundation.solidSurface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.all24,
          ),
        ),
        boldTextTheme: UiKitBoldTextTheme(foregroundColor: Colors.black),
        regularTextTheme: UiKitRegularTextTheme(foregroundColor: Colors.black),
        bottomSheetTheme: UiKitBottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.onlyTop40,
          ),
          sheetSliderColor: ColorsFoundation.darkNeutral500,
        ),
      ),
    ],
  );
  late final defaultThemeData = ThemeData(
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white,
      textStyle: TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Color(0x00000000),
        package: 'shuffle_uikit',
      ),
    ),
    scaffoldBackgroundColor: Colors.black,
    useMaterial3: false,
    splashColor: ColorsFoundation.darkNeutral500.withOpacity(0.24),
    splashFactory: WaveSplash.splashFactory,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      modalBackgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      enableFeedback: true,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: WidgetStateTextStyle.resolveWith((states) {
        return const TextStyle(
          fontFamily: 'Unbounded',
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xffffffff),
          package: 'shuffle_uikit',
          overflow: TextOverflow.ellipsis,
        );
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.white),
      overlayColor: WidgetStateProperty.resolveWith((states) => Colors.transparent),
    )),
    dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: _pickerTextStyle,
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) => UiKitColors.surface4),
          // elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorsFoundation.solidSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
        )),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
      textStyle: WidgetStateTextStyle.resolveWith((states) {
        return const TextStyle(
          fontFamily: 'Unbounded',
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xffffffff),
          package: 'shuffle_uikit',
          overflow: TextOverflow.ellipsis,
        );
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.white),
      overlayColor: WidgetStateProperty.resolveWith((states) => Colors.transparent),
    )),
    disabledColor: ColorsFoundation.darkNeutral300,
    timePickerTheme: TimePickerThemeData(
        helpTextStyle: _pickerTextStyle.copyWith(fontSize: 16),
        backgroundColor: UiKitColors.surface4,
        hourMinuteShape: RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all8),
        hourMinuteColor: ColorsFoundation.deepPurple,
        dialHandColor: ColorsFoundation.deepPurple,
        hourMinuteTextColor: Colors.white,
        entryModeIconColor: Colors.white,
        dialTextColor: Colors.white,
        dayPeriodTextColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all28),
        dialBackgroundColor: ColorsFoundation.darkNeutral500.withOpacity(0.24)),
    datePickerTheme: DatePickerThemeData(
      rangePickerBackgroundColor: UiKitColors.surface4,
      // dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
      //   if (states.contains(MaterialState.selected) ||
      //       states.contains(MaterialState.focused) ||
      //       states.contains(MaterialState.pressed)) {
      //     return UiKitColors.surface4;
      //   }
      //   return Colors.transparent;
      // }),
      rangeSelectionBackgroundColor: ColorsFoundation.deepPurple.withOpacity(0.24),
      dayForegroundColor: WidgetStateProperty.resolveWith((states) => Colors.white),
      yearForegroundColor: WidgetStateProperty.resolveWith((states) => Colors.white),
      surfaceTintColor: ColorsFoundation.deepPurple,
      rangePickerHeaderHelpStyle: _pickerTextStyle,
      yearStyle: _pickerTextStyle,
      headerHelpStyle: _pickerTextStyle,
      rangePickerHeaderHeadlineStyle: _pickerTextStyle,
      // rangePickerShape: const CircleBorder(side: BorderSide(color: Colors.white, width: 1)),
      weekdayStyle: _pickerTextStyle.copyWith(color: ColorsFoundation.darkNeutral900),
      headerHeadlineStyle: _pickerTextStyle,
      dayStyle: _pickerTextStyle.copyWith(fontSize: 16),
      backgroundColor: UiKitColors.surface4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all28),
      // dialBackgroundColor: ColorsFoundation.darkNeutral500
    ),

    colorScheme:
        ColorScheme.fromSeed(seedColor: UiKitColors.deepPurple, onSurface: Colors.white, brightness: Brightness.dark),
    // colorScheme:  const ColorScheme.light().copyWith(onSurface: Colors.white),
    extensions: <ThemeExtension<UiKitThemeData>>[
      UiKitThemeData(
        themeMode: ThemeMode.dark,
        cardColor: ColorsFoundation.surface1,
        customColor: Colors.red,
        chipTheme: UiKitChipThemeData(
          border: Border.all(color: Colors.white, width: 2),
          backgroundColor: ColorsFoundation.solidSurface,
        ),
        blurredBottomNavigationBarTheme: BlurredBottomNavigationBarTheme(
          iconColors: Colors.white,
        ),
        ordinaryButtonStyle: ButtonStyle(
          fixedSize: WidgetStateProperty.resolveWith(
            (states) => const Size.fromHeight(48),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.disabled) ? ColorsFoundation.darkNeutral300 : Colors.white;
          }),
          shape: WidgetStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
          ),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            return ColorsFoundation.darkNeutral900;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.black),
        ),
        smallOrdinaryButtonStyle: ButtonStyle(
          fixedSize: WidgetStateProperty.resolveWith((states) => const Size.fromHeight(28)),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.disabled) ? ColorsFoundation.darkNeutral300 : Colors.white;
          }),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            return ColorsFoundation.darkNeutral900;
          }),
          shape: WidgetStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
          ),
          foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.black),
        ),
        iconInputTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorsFoundation.solidSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
        ),
        noIconInputBorderRadius20: InputDecorationTheme(
          filled: true,
          fillColor: ColorsFoundation.solidSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all20,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all20,
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all20,
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all20,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.all20,
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
            borderRadius: BorderRadiusFoundation.max,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
            borderSide: const BorderSide(
              color: ColorsFoundation.error,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusFoundation.max,
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
          disabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: ColorsFoundation.darkNeutral900, width: 0.5)),
        ),
        customAppBapTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          toolbarHeight: 84,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white.withOpacity(0.07),
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        uiKitTabBarTheme: TabBarThemeData(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: ColorsFoundation.lightBodyTypographyColor,
          unselectedLabelColor: ColorsFoundation.darkHeadingTypographyColor,
          indicator: BoxDecoration(
            borderRadius: BorderRadiusFoundation.max,
            color: ColorsFoundation.lightSurface,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.max,
          ),
        ),
        cardTheme: CardThemeData(
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
        colorScheme: const UiKitColorScheme.dark(),
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
        fixedSize: WidgetStateProperty.resolveWith((states) => const Size.fromHeight(48)),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.disabled) ? ColorsFoundation.darkNeutral300 : Colors.white;
        }),
        shape: WidgetStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
        ),
        foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.black),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.white;
          }

          return ColorsFoundation.darkNeutral300;
        }),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.white,
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      indicator: BoxDecoration(
        borderRadius: BorderRadiusFoundation.max,
        color: Colors.white,
      ),
    ),
    cardColor: ColorsFoundation.surface3,
    appBarTheme: AppBarTheme(
      toolbarHeight: 84,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.black.withOpacity(0.07),
      centerTitle: true,
    ),
  );
}
