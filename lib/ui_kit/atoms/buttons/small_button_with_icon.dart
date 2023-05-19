import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallButtonWithIcon extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final VoidCallback? onPressed;

  const SmallButtonWithIcon({
    super.key,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: Colors.white.withOpacity(0.1),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.1),
          ),
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: icon?.paddingAll(EdgeInsetsFoundation.all8),
            ),
          ),
        ),
      ),
    );
  }
}
