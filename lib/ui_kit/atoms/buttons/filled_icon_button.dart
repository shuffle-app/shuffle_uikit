import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class FilledIconButton extends StatelessWidget implements ButtonFactory {
  final Widget icon;
  final VoidCallback? onPressed;

  const FilledIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      color: enabled ? colorScheme?.inversePrimary.withOpacity(0.1) : ColorsFoundation.darkNeutral300,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          height: 48.h,
          width: 48.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
