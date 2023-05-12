import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitGradientQuestionChip extends StatelessWidget {
  final String? message;
  final VoidCallback? onTap;

  const UiKitGradientQuestionChip({
    Key? key,
    this.message,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: GradientQuestionChipClipper(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: GradientFoundation.badgeIcon,
        ),
        child: Text(
          message ?? '',
          style: context.uiKitTheme?.boldTextTheme.caption2Medium,
        ).paddingSymmetric(
          vertical: EdgeInsetsFoundation.vertical12,
          horizontal: EdgeInsetsFoundation.horizontal32,
        ),
      ),
    );
  }
}

class GradientQuestionChipClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final height = size.height;
    final width = size.width;
    path.moveTo(0, height);
    path.cubicTo(32.w, height * 0.75, 0, height * 0, 32.w, 0);
    path.lineTo(width - 32.w, 0);
    path.cubicTo(width, height * 0, width - 32.w, height * 0.75, width, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
