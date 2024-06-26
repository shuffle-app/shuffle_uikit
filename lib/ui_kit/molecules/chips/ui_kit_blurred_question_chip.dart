import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBlurredQuestionChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const UiKitBlurredQuestionChip({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final isLightTheme = theme?.themeMode == ThemeMode.light;
    final textStyle = theme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: ColorsFoundation.darkNeutral900,
      fontSize: 7.w,
    );

    return Material(
      color: isLightTheme ? ColorsFoundation.neutral8 : ColorsFoundation.neutral24,
      borderRadius: BorderRadiusFoundation.all12,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 19, sigmaY: 19, tileMode: TileMode.decal),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isLightTheme
                      ? theme?.colorScheme.darkNeutral500 ?? ColorsFoundation.darkNeutral500
                      : ColorsFoundation.neutral16,
                  width: 1.sp,
                ),
                borderRadius: BorderRadiusFoundation.all12,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsFoundation.darkNeutral900,
                    ),
                    child: Text(
                      '?',
                      textAlign: TextAlign.center,
                      style: theme?.boldTextTheme.caption1UpperCaseMedium.copyWith(color: theme.colorScheme.primary),
                    ),
                  ),
                  SpacingFoundation.horizontalSpace4,
                  Text(
                    label.toUpperCase(),
                    style: textStyle,
                  ),
                ],
              ).paddingSymmetric(
                vertical: SpacingFoundation.horizontalSpacing2,
                horizontal: SpacingFoundation.horizontalSpacing6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
