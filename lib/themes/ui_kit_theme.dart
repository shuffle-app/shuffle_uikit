import 'package:flutter/material.dart';

class UiKitTheme extends InheritedWidget {
  final ValueChanged<ThemeData> onThemeUpdated;

  const UiKitTheme({
    required this.onThemeUpdated,
    required super.child,
    super.key,
  });

  static UiKitTheme of(BuildContext context) => context.findAncestorWidgetOfExactType<UiKitTheme>()!;

  void updateTheme(ThemeData data) {
    onThemeUpdated(data);
  }

  @override
  bool updateShouldNotify(covariant UiKitTheme oldWidget) => false;
}
