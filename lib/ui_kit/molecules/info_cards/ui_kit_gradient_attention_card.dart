import 'package:flutter/material.dart';
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
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: GradientFoundation.attentionCard,
        borderRadius: BorderRadiusFoundation.all24,
      ),
      child: Stack(
        fit: StackFit.expand,
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
            bottom: SpacingFoundation.verticalSpacing8,
            left: 0,
            child: ImageWidget(
              width: width * 0.75,
              fit: BoxFit.fitWidth,
              color: Colors.black,
              iconData: ShuffleUiKitIcons.tripleArrowBlack,
            ),
          ),
        ],
      ),
    );
  }
}
