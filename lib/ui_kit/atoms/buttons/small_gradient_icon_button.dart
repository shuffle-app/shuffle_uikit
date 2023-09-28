import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallGradientIconButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Widget icon;

  const SmallGradientIconButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          decoration: const BoxDecoration(
            gradient: GradientFoundation.defaultRadialGradient,
            shape: BoxShape.circle,
          ),
          child: icon.paddingAll(EdgeInsetsFoundation.all12),
        ),
      ),
    );
  }
}
