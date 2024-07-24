import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitRingsDecoration extends StatelessWidget {
  final int ringsCount;

  const UiKitRingsDecoration({
    super.key,
    required this.ringsCount,
  });

  Size get size => Size(0.3875.sw * ringsCount, 0.3875.sw * ringsCount);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Stack(
        children: List.generate(
          ringsCount,
          (index) {
            double width = 0.3875.sw + (124 * index);
            double height = 0.3875.sw + (124 * index);
            if (index != 0) {
              width += width * (0.20 - (index / 100));
              height += height * (0.20 - (index / 100));
            }

            return Positioned(
              left: (size.width - width) / 2,
              top: (size.height - height) / 2,
              child: Opacity(
                opacity: 0.5 - ((0.25 / ringsCount) * index),
                child: Container(
                  width: width,
                  height: height,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    border: GradientFoundation.updatePageGradientRings,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
