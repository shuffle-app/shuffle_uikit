import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBlurredQuestionChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const UiKitBlurredQuestionChip({
    Key? key,
    required this.label,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: ColorsFoundation.darkNeutral900,
      fontSize: 10,
    );

    return Container(
      width: 80.w,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsFoundation.darkNeutral500.withOpacity(0.16),
          width: 1,
        ),
        color: ColorsFoundation.darkNeutral500,
        borderRadius: BorderRadiusFoundation.all12,
      ),
      child: InkWell(
      onTap: onTap,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 18.h,
              width: 18.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsFoundation.darkNeutral900,
              ),
              child: Center(
                child: Text(
                  '?',
                  style: context.uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(color: Colors.black),
                ),
              ),
            ),
            SpacingFoundation.horizontalSpace4,
            Expanded(
              child: Text(
                label.toUpperCase(),
                style: textStyle,
              ),
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all4),
      )),
    );
  }
}
