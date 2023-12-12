import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MemberPlate extends StatelessWidget {
  const MemberPlate({super.key});

  double? get width => 1.sw * 0.55625;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.max,
        gradient: GradientFoundation.greyGradient,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'shuffle',
            style: textTheme?.caption1Bold.copyWith(color: Colors.black),
          ),
          SpacingFoundation.horizontalSpace4,
          const GradientableWidget(
              gradient: GradientFoundation.badgeIcon,
              child: ImageWidget(
                iconData: ShuffleUiKitIcons.memeberGradientStar,
                color: Colors.white,
              )),
          SpacingFoundation.horizontalSpace4,
          Text(
            S.of(context).Members.toLowerCase(),
            style: textTheme?.caption1Medium.copyWith(color: Colors.black),
          ),
        ],
      ).paddingSymmetric(
        horizontal: EdgeInsetsFoundation.horizontal16,
        vertical: EdgeInsetsFoundation.vertical4,
      ),
    );
  }
}
