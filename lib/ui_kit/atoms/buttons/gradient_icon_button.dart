import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GradientIconButton extends StatelessWidget implements ButtonFactory {
  final Widget icon;
  final VoidCallback? onPressed;

  const GradientIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusFoundation.all24,
          gradient: enabled ? GradientFoundation.buttonGradient : null,
          color: enabled ? null : ColorsFoundation.darkNeutral300,
        ),
        child: icon.paddingAll(EdgeInsetsFoundation.all12),
      ),
    );
  }
}
