import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/foundation/colors_foundation.dart';
import 'package:shuffle_uikit/utils/widgets_factory/widgets_factory.dart';

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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48.h,
        width: 48.w,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: enabled ? Colors.white.withOpacity(0.1) : ColorsFoundation.darkNeutral300,
          shape: BoxShape.circle,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
