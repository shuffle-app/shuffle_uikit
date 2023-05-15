import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OutlinedIconButton extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final VoidCallback? onPressed;

  const OutlinedIconButton({
    Key? key,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;

    return Material(
      shape: const CircleBorder(),
      color: enabled ? Colors.white.withOpacity(0.01) : ColorsFoundation.darkNeutral300,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadiusFoundation.max,
        onTap: onPressed,
        child: Ink(
          height: 48.h,
          width: 48.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: enabled ? Colors.white : ColorsFoundation.darkNeutral500,
              width: 2.w,
            ),
          ),
          child: icon,
        ),
      ),
    );
  }
}
