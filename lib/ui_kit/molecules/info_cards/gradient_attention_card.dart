import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientAttentionCard extends StatelessWidget {
  final String message;
  final Color? textColor;

  const GradientAttentionCard({
    Key? key,
    required this.message,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageStyle = context.uiKitTheme?.boldTextTheme.subHeadline;
    return Container(
      height: 82.h,
      decoration: BoxDecoration(
        gradient: GradientFoundation.defaultRadialGradient,
        borderRadius: BorderRadiusFoundation.all24,
      ),
      child: Stack(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            message,
            style: messageStyle?.copyWith(color: textColor),
          ).paddingOnly(left: 16.sp, top: 16.sp, right: 16.sp),
          ImageWidget(
            svgAsset: Assets.images.svg.trippleArrowBlack,
            height: 80.h,
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }
}
