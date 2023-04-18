import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popover/popover.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<T?> showUiKitPopover<T extends Object?>(BuildContext context,
    {required Widget title,
    Widget? description,
    required String buttonText,
    VoidCallback? onPop}) {
//TODO: move border radiuses to constants
//TODO: move paddings constants
  return showPopover<T>(
    context: context,
    backgroundColor: context.uiKitTheme?.cardTheme.color ?? Colors.white,
    transitionDuration: const Duration(milliseconds: 250),
    bodyBuilder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        title.paddingOnly(bottom: 8.h),
        if (description != null) description.paddingSymmetric(vertical: 8.h),
        GeneralPurposeButton(
          text: buttonText,
          onPressed: () => context.pop(),
        ).paddingOnly(
          top: 8.h,
        )
      ],
    ).paddingAll(24.sp),
    radius: 24.r,
    constraints: BoxConstraints(minWidth: 80.w, minHeight: 80.h),
    onPop: onPop,
    direction: PopoverDirection.bottom,
  );
}
