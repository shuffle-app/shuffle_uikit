import 'package:flutter/material.dart';

class UiKitThemeProvider extends InheritedWidget {
  final ValueChanged<ThemeData> onThemeUpdated;

  const UiKitThemeProvider({
    required this.onThemeUpdated,
    required super.child,
    super.key,
  });

  static UiKitThemeProvider of(BuildContext context) => context.findAncestorWidgetOfExactType<UiKitThemeProvider>()!;

  void updateTheme(ThemeData data) {
    onThemeUpdated(data);
  }

  @override
  bool updateShouldNotify(covariant UiKitThemeProvider oldWidget) => false;
}
