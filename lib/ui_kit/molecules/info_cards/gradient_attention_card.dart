import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitGradientAttentionCard extends StatelessWidget {
  final String message;
  final Color? textColor;

  const UiKitGradientAttentionCard({
    Key? key,
    required this.message,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageStyle = context.uiKitTheme?.boldTextTheme.subHeadline;
    return Container(
      decoration: BoxDecoration(
        gradient: GradientFoundation.defaultRadialGradient,
        borderRadius: BorderRadiusFoundation.all24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: messageStyle?.copyWith(color: textColor),
          ).paddingAll(EdgeInsetsFoundation.all20),
          ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.trippleArrowBlack,
          ),
        ],
      ),
    );
  }
}
