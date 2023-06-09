import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallBlurredButtonWithIcon extends StatelessWidget implements ButtonFactory {
  final Widget icon;
  final VoidCallback? onPressed;

  const SmallBlurredButtonWithIcon({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

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
              child: icon.paddingAll(EdgeInsetsFoundation.all12),
            ),
          ),
        ),
      ),
    );
  }
}
