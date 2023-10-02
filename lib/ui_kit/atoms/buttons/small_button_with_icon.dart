import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallButtonWithIcon extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final VoidCallback? onPressed;
  final Color? color;

  const SmallButtonWithIcon({
    super.key,
    this.icon,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: color ?? Colors.white.withOpacity(0.1),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color ?? Colors.white.withOpacity(0.1),
          ),
          child: icon?.paddingAll(EdgeInsetsFoundation.all8),
        ),
      ),
    );
  }
}
