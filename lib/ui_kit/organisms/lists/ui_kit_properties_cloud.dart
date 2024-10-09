import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPropertiesCloud extends StatelessWidget {
  const UiKitPropertiesCloud({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    return UiKitCardWrapper(
      color: uiKitTheme?.colorScheme.surface1,
      borderRadius: BorderRadiusFoundation.all12,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: child,

    );
  }
}
