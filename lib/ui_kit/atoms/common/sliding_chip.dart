import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/ui_kit_external.dart';

class SlidingChip extends StatelessWidget {
  const SlidingChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusFoundation.all24,
          color: (context.uiKitTheme?.bottomSheetTheme as UiKitBottomSheetThemeData?)?.sheetSliderColor ?? Colors.black),
      child: SizedBox(
        width: 60.w,
        height: 4.h,
      ),
    );
  }
}
