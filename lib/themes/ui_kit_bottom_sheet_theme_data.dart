import 'package:flutter/material.dart';

class UiKitBottomSheetThemeData extends BottomSheetThemeData {
  final Color sheetSliderColor;

  const UiKitBottomSheetThemeData({
    super.backgroundColor,
    super.surfaceTintColor,
    super.elevation,
    super.modalBackgroundColor,
    super.modalBarrierColor,
    super.modalElevation,
    super.shape,
    super.clipBehavior,
    super.constraints,
    required this.sheetSliderColor,
  });
}
