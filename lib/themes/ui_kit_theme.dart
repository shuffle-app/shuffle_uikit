import 'package:flutter/material.dart';

class UiKitTheme extends InheritedWidget {
  static UiKitTheme of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<UiKitTheme>()!;
  final ValueChanged<ThemeData> onThemeUpdated;

  const UiKitTheme({
    required this.onThemeUpdated,
    required super.child,
    super.key,
  });

  void updateTheme(ThemeData data) {
    onThemeUpdated(data);
  }

  @override
  bool updateShouldNotify(covariant UiKitTheme oldWidget) => false;
}
