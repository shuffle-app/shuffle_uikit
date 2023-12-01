import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LocaleModel {
  final Locale locale;
  final String iconLink;
  final String name;

  const LocaleModel({
    required this.locale,
    required this.name,
    required this.iconLink,
  });

  LocaleModel.fromLocale(this.locale)
      : name = switch (locale.languageCode) {
          'ru' => 'Русский',
          'en' => 'English',
          'hi' => 'हिंदी',
          'ar' => 'عرب',
          String() => 'other',
        },
        iconLink = switch (locale.languageCode) {
          'ru' => GraphicsFoundation.instance.svg.russia.path,
          'en' => GraphicsFoundation.instance.svg.unitedKingdom.path,
          'hi' => GraphicsFoundation.instance.svg.india.path,
          'ar' => GraphicsFoundation.instance.svg.arabic.path,
          String() => GraphicsFoundation.instance.svg.arabic.path,
        };
}
