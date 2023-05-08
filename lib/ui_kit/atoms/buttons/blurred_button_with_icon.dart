import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BlurredButtonWithIcon extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Widget icon;

  const BlurredButtonWithIcon({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipOval(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: icon.paddingAll(EdgeInsetsFoundation.all16),
          ),
        ),
      ),
    );
  }
}
