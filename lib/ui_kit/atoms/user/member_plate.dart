import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MemberPlate extends StatelessWidget {
  const MemberPlate({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textTheme = theme?.boldTextTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.max,
        gradient: GradientFoundation.memberPlate,
        border: GradientFoundation.shuffleMemberBorder,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.4),
            blurRadius: 10,
          ),
        ],
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
          const ImageWidget(
            iconData: ShuffleUiKitIcons.memeberGradientStar,
            color: Colors.black,
          ),
          SpacingFoundation.horizontalSpace4,
          GradientableWidget(
            gradient: GradientFoundation.defaultLinearGradient,
            child: Text(
              'members',
              style: textTheme?.caption1Medium.copyWith(color: Colors.white),
            ),
          ),
        ],
      ).paddingSymmetric(
        horizontal: EdgeInsetsFoundation.horizontal16,
        vertical: EdgeInsetsFoundation.vertical4,
      ),
    );
  }
}
