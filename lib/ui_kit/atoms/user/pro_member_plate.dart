import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProMemberPlate extends StatelessWidget {
  const ProMemberPlate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textTheme = theme?.boldTextTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.max,
        gradient: GradientFoundation.shuffleMemberPlate,
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
          GradientableWidget(
            gradient: GradientFoundation.premiumLinearGradient,
            child: Text(
              'pro',
              style: textTheme?.caption1Bold.copyWith(color: Colors.white),
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
