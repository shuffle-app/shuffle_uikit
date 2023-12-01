import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBlurredQuestionChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const UiKitBlurredQuestionChip({Key? key, required this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: ColorsFoundation.darkNeutral900,
      fontSize: 7.w,
    );

    return Material(
      color: Colors.black,
      borderRadius: BorderRadiusFoundation.all12,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorsFoundation.darkNeutral500.withOpacity(0.16),
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
                      style: context.uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(color: Colors.black),
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
