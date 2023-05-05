import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OutlinedIconButton extends StatelessWidget implements ButtonFactory {
  final Widget icon;
  final VoidCallback? onPressed;

  const OutlinedIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48.h,
        width: 48.w,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: enabled ? Colors.white.withOpacity(0.01) : ColorsFoundation.darkNeutral300,
          shape: BoxShape.circle,
          border: Border.all(
            color: enabled ? Colors.white : ColorsFoundation.darkNeutral500,
            width: 2.w,
          ),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
