import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitThemeFoundation {
  UiKitThemeFoundation._();
  static final _themes = UiKitThemes();
  static ThemeData get defaultTheme => _themes.defaultThemeData;
  static ThemeData get fallbackTheme => _themes.fallbackThemeData;
}
