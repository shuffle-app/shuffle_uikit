import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SlidingChip extends StatelessWidget {
  final Color? color;

  const SlidingChip({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
        color: color ?? (context.uiKitTheme?.bottomSheetTheme as UiKitBottomSheetThemeData?)?.sheetSliderColor ?? Colors.black,
      ),
      child: SizedBox(
        width: 60.w,
        height: 4.h,
      ),
    );
  }
}
