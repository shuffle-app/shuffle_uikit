import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LocaleModel {
  final Locale locale;
  final IconData icon;
  final String name;

  const LocaleModel({
    required this.locale,
    required this.name,
    required this.icon,
  });

  LocaleModel.fromLocale(this.locale)
      : name = switch (locale.languageCode) {
          'ru' => 'Русский',
          'en' => 'English',
          'hi' => 'Hindu',
          'ar' => 'عرب',
          String() => 'other',
        },
        icon = switch (locale.languageCode) {
          'ru' => ShuffleUiKitIcons.russia,
          'en' => ShuffleUiKitIcons.unitedKingdom,
          'hi' => ShuffleUiKitIcons.india,
          'ar' => ShuffleUiKitIcons.arabic,
          String() => ShuffleUiKitIcons.arabic,
        };
}
