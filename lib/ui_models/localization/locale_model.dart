import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/graphics_foundation.dart';

class LocaleModel {
  final Locale locale;
  final String iconPath;
  final String name;

  const LocaleModel({
    required this.locale,
    required this.name,
    required this.iconPath,
  });

  LocaleModel.fromLocale(this.locale)
      : name = switch (locale.languageCode) {
          'ru' => 'Русский',
          'en' => 'English',
          'hi' => 'Hindi',
          'ar' => 'عرب',
          String() => 'other',
        },
        iconPath = switch (locale.languageCode) {
          'ru' => GraphicsFoundation.instance.svg.russia.path,
          'en' => GraphicsFoundation.instance.svg.unitedKingdom.path,
          'hi' => GraphicsFoundation.instance.svg.india.path,
          'ar' => GraphicsFoundation.instance.svg.arabic.path,
          String() => GraphicsFoundation.instance.svg.arabic.path,
        };
}
