import 'dart:ui';

import 'package:flutter/material.dart';

class LocaleModel {
  final Locale locale;
  final String iconPath;
  final String name;

  const LocaleModel({
    required this.locale,
    required this.name,
    required this.iconPath,
  });
}
