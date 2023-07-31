import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/sizes_foundation.dart';

class UiKitHorizontalScrollCardCover extends StatelessWidget {
  final Widget Function(BuildContext, int)? itemBuilder;
  final int itemCount;

  const UiKitHorizontalScrollCardCover({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    double calculatedWidth = SizesFoundation.screenWidth;

    return SizedBox(
        height: calculatedWidth * 0.5,
        child: Swiper(
          loop: false,
          fade: 0.1,
          index: 1,
          itemCount: itemCount,
          viewportFraction: 0.8,
          scale: 1.15,
          itemBuilder: itemBuilder,
        ));
  }
}
