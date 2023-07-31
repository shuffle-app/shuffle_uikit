import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/sizes_foundation.dart';
import 'package:wheel_slider/wheel_slider.dart';

class UiKitHorizontalScroll extends StatelessWidget {
  final double itemSize;
  final int totalCount;
  final List<Widget> children;

  const UiKitHorizontalScroll({
    super.key,
    required this.itemSize,
    required this.totalCount,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    double calculatedWidth = SizesFoundation.screenWidth;

    return WheelSlider.customWidget(
      squeeze: 1.2,
      listWidth: calculatedWidth * 0.5,
      horizontalListHeight: calculatedWidth * 0.5,
      perspective: 0.0025,
      showPointer: false,
      onValueChanged: (val) {
        val;
      },
      itemSize: calculatedWidth * 0.82,
      totalCount: totalCount,
      initValue: 1,
      isInfinite: false,
      children: children,
    );
  }
}
