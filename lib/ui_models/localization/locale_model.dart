import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LocaleModel {
  final Locale locale;
  final String iconLink;
  final String name;
  final bool enabled;
  final int sortNumber;

  const LocaleModel({
    required this.locale,
    required this.name,
    required this.iconLink,
    this.enabled = true,
    required this.sortNumber,
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
        },
        enabled = switch (locale.languageCode) {
          'ru' => true,
          'en' => true,
          'hi' => true,
          'ar' => false,
          String() => false,
        },
        sortNumber = switch (locale.languageCode) {
          'ru' => 2,
          'en' => 1,
          'hi' => 3,
          'ar' => 4,
          String() => 0,
        };

  @override
  bool operator ==(Object other) => other is LocaleModel && other.name == name;

  @override
  int get hashCode => name.hashCode;
}
