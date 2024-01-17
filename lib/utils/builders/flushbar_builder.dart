import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Flushbar showNoNetworkFlushbar(BuildContext context) {
  final theme = context.uiKitTheme;

  final flushbar = Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: (theme?.colorScheme.darkNeutral900 ?? Colors.grey).withOpacity(0.24),
    barBlur: 10,
    padding: EdgeInsets.symmetric(vertical: 1.5.h),
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    borderRadius: BorderRadiusFoundation.all8,
    isDismissible: false,
    messageText: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      GradientableWidget(
        gradient: GradientFoundation.touchIdLinearGradient,
        child: ImageWidget(
          svgAsset: Assets.images.svg.cloudOff,
          color: Colors.white,
        ),
      ),
      SpacingFoundation.horizontalSpace8,
      Text(
        S.current.NoConnection,
        style: theme?.regularTextTheme.caption4Regular,
      )
    ]),
  );

  flushbar.show(context);

  return flushbar;
}
