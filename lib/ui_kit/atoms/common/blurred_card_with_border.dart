import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BlurredCardWithBorder extends StatelessWidget {
  final Widget child;
  final BoxBorder? border;
  final bool? hasShadow;

  const BlurredCardWithBorder({
    Key? key,
    required this.child,
    this.border,
    this.hasShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
        border: border ?? Border.all(color: Colors.white, width: 2),
        color: Colors.white.withOpacity(0.1),
        boxShadow: [
          if (hasShadow ?? false)
            const BoxShadow(
              color: ColorsFoundation.shadowPink,
              blurRadius: 18,
              spreadRadius: 0,
              offset: Offset.zero,
              blurStyle: BlurStyle.outer,
            ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusFoundation.all24,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: child,
        ).paddingAll(EdgeInsetsFoundation.all16),
      ),
    );
  }
}
