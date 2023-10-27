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
      : name = locale.languageCode == 'ru'
            ? 'Русский'
            : locale.languageCode == 'en'
                ? 'English'
                : 'عرب',
        iconPath = locale.languageCode == 'ru'
            ? GraphicsFoundation.instance.svg.russia.path
            : locale.languageCode == 'en'
                ? GraphicsFoundation.instance.svg.unitedKingdom.path
                : GraphicsFoundation.instance.svg.arabic.path;
}
