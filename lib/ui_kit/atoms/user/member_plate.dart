import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MemberPlate extends StatelessWidget {
  const MemberPlate({super.key});

  double? get width => 1.sw * 0.55625;

  @override
  Widget build(BuildContext context) {
    final width = 1.sw * 0.55625;
    final height = width * 0.1573;
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: EdgeInsetsFoundation.horizontal12,
        vertical: EdgeInsetsFoundation.vertical6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.max,
        gradient: GradientFoundation.greyGradient,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'shuffle',
            style: textTheme?.caption1Bold.copyWith(color: Colors.black),
          ),
          // SpacingFoundation.horizontalSpace4,
          Transform.scale(
              scale: 1.5,
              child: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.memeberGradientStar,
                // fit: BoxFit.fitHeight,
                // height: height,
              )),
          // SpacingFoundation.horizontalSpace4,
          Text(
            'members',
            style: textTheme?.caption1Medium.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
