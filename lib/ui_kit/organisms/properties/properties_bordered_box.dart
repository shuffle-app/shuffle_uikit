import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PropertiesBorderedBox extends StatelessWidget {
  const PropertiesBorderedBox({
    super.key,
    this.title,
    this.child,
  });

  final Widget? title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: uiKitTheme?.colorScheme.darkNeutral500.withOpacity(0.24) ??
              ColorsFoundation.darkNeutral500.withOpacity(0.24),
        ),
        borderRadius: BorderRadiusFoundation.all16,
      ),
      child: Column(
        children: [
          title ?? const SizedBox(),
          child ?? const SizedBox(),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
