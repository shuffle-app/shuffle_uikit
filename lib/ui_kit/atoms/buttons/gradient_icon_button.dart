import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GradientIconButton extends StatelessWidget implements ButtonFactory {
  final Widget icon;
  final VoidCallback? onPressed;
  final BorderRadius? borderRadius;

  const GradientIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;

    return Material(
      borderRadius: borderRadius ?? BorderRadiusFoundation.all24,
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadiusFoundation.all24,
        onTap: enabled ? onPressed : null,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadiusFoundation.all24,
            gradient: enabled ? GradientFoundation.buttonGradient : null,
            color: enabled ? null : ColorsFoundation.darkNeutral300,
          ),
          child: icon.paddingAll(EdgeInsetsFoundation.all12),
        ),
      ),
    );
  }
}
