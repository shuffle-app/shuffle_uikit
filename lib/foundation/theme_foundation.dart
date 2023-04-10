import 'package:flutter/material.dart';
import 'package:shuffle_uikit/themes/default_theme.dart';

class UiKitThemeFoundation {
  static final _themes = UiKitThemes();
  static ThemeData get defaultTheme => _themes.defaultThemeData;
}
