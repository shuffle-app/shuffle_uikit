import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SlidingChip extends StatelessWidget {
  const SlidingChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusFoundation.all24,
          //TODO:check color
          color: context.uiKitTheme?.customColor),
      child: SizedBox(
        width: 60.w,
        height: 4.h,
      ),
    );
  }
}
