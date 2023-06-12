import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitGradientAttentionCard extends StatelessWidget {
  final String message;
  final Color? textColor;
  final double width;

  const UiKitGradientAttentionCard({
    Key? key,
    required this.message,
    this.textColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageStyle = context.uiKitTheme?.boldTextTheme.subHeadline;

    return Container(
      height: width,
      decoration: BoxDecoration(
        gradient: GradientFoundation.attentionCard,
        borderRadius: BorderRadiusFoundation.all24,
      ),
      child: Stack(
        children: [
          Text(
            message,
            style: messageStyle?.copyWith(color: textColor),
          ).paddingOnly(
            left: EdgeInsetsFoundation.all16,
            top: EdgeInsetsFoundation.all16,
            right: EdgeInsetsFoundation.all16,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: ImageWidget(
              width: width,
              fit: BoxFit.fitWidth,
              svgAsset: GraphicsFoundation.instance.svg.trippleArrowBlack,
            ),
          ),
        ],
      ),
    );
  }
}
