import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PremiumUserBadge extends StatelessWidget {
  const PremiumUserBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return DynamicGradientPlate(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'shuffle',
            style: textTheme?.caption1Bold.copyWith(color: Colors.black),
          ),
          SpacingFoundation.horizontalSpace4,
          ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.gradientStar,
            height: 0.05.sw,
            width: 0.05.sw,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
