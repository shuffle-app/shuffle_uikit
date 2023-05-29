import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

showUiKitBottomSheet(
  BuildContext context, {
  required Widget child,
  double? topPadding,
  String? title,
}) {
  final bottomSheetTheme = context.uiKitTheme?.bottomSheetTheme;
  final boldTextTheme = context.uiKitTheme?.boldTextTheme;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: bottomSheetTheme?.backgroundColor,
    shape: bottomSheetTheme?.shape,
    useRootNavigator: true,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 50,
          sigmaY: 50,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadiusFoundation.onlyTop40,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SlidingChip(
                color: ColorsFoundation.darkNeutral500.withOpacity(0.24),
              ).paddingOnly(
                top: SpacingFoundation.verticalSpacing12,
                bottom: SpacingFoundation.verticalSpacing4,
              ),
              if (title != null) ...[
                SpacingFoundation.verticalSpace16,
                Text(
                  title,
                  style: boldTextTheme?.subHeadline,
                ),
                SpacingFoundation.verticalSpace16,
              ],
              child,
            ],
          ),
        ).paddingOnly(
          top: topPadding ?? SpacingFoundation.verticalSpacing24,
        ),
      );
    },
  );
}
