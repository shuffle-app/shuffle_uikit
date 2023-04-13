import 'package:flutter/material.dart';
import 'package:shuffle_uikit/themes/default_theme.dart';

class UiKitThemeFoundation {
  UiKitThemeFoundation._();
  static final _themes = UiKitThemes();
  static ThemeData get defaultTheme => _themes.defaultThemeData;
  static ThemeData get fallbackTheme => _themes.fallbackThemeData;
}
