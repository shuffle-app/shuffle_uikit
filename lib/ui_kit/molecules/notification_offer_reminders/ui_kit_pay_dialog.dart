import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

uiKitPayDialog({
  required BuildContext context,
  VoidCallback? onPayTap,
  String? title,
  int? price,
}) {
  final theme = context.uiKitTheme;

  return showGeneralDialog(
    context: context,
    transitionBuilder: (context, animation1, animation2, child) => BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: animation1.value * 30,
        sigmaY: animation1.value * 30,
      ),
      child: child,
    ),
    pageBuilder: (context, animation1, animation2) => FadeTransition(
      opacity: animation1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: ImageWidget(
              iconData: ShuffleUiKitIcons.cross,
              color: theme?.colorScheme.darkNeutral900,
              height: 19.h,
              fit: BoxFit.fitHeight,
            ),
          ),
          SpacingFoundation.verticalSpace16,
          UiKitCardWrapper(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title ?? S.of(context).PayForTheBonusOffer,
                  style: theme?.boldTextTheme.title2.copyWith(color: theme.colorScheme.primary),
                  textAlign: TextAlign.center,
                ),
                SpacingFoundation.verticalSpace12,
                Text(
                  '$price\$',
                  style: theme?.boldTextTheme.body.copyWith(
                    color: theme.colorScheme.inverseBodyTypography,
                  ),
                  textAlign: TextAlign.center,
                ),
                SpacingFoundation.verticalSpace12,
                context.gradientButton(
                  data: BaseUiKitButtonData(
                    fit: ButtonFit.fitWidth,
                    text: S.of(context).Pay,
                    onPressed: onPayTap,
                  ),
                ),
              ],
            ).paddingAll(EdgeInsetsFoundation.all16),
          ),
        ],
      ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
    ),
  );
}
