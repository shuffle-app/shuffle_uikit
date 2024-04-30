import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BlurredCardWithBorder extends StatelessWidget {
  final Widget child;
  final BoxBorder? border;

  const BlurredCardWithBorder({
    Key? key,
    required this.child,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
        border: border ?? Border.all(color: theme?.colorScheme.inverseSurface ?? Colors.transparent, width: 2),
        color: colorScheme?.surface1,
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusFoundation.all24,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: child,
        ).paddingAll(EdgeInsetsFoundation.all16),
      ),
    );
  }
}
