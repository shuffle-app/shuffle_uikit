import 'package:flutter/material.dart';

class UiKitTheme extends InheritedWidget {
  static UiKitTheme of(BuildContext context) => context.findAncestorWidgetOfExactType<UiKitTheme>()!;
  final ValueChanged<ThemeData> onThemeUpdated;
  final ValueChanged<Locale> onLocaleUpdated;

  const UiKitTheme({
    required this.onThemeUpdated,
    required this.onLocaleUpdated,
    required super.child,
    super.key,
  });

  void updateTheme(ThemeData data) {
    onThemeUpdated(data);
  }

  void updateLocale(Locale locale) {
    onLocaleUpdated(locale);
  }

  @override
  bool updateShouldNotify(covariant UiKitTheme oldWidget) => false;
}
