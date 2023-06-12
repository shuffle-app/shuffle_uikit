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
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
        border: border ?? Border.all(color: Colors.white, width: 2),
        color: Colors.black.withOpacity(0.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusFoundation.all24,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: child,
        ).paddingAll(EdgeInsetsFoundation.all16),
      ),
    );
  }
}
