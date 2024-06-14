import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitAreaSelector extends StatelessWidget {
  final Size size;
  final ValueChanged<double>? onScroll;
  final ValueNotifier<AreaSelectorData> previewUpdateNotifier;

  const UiKitAreaSelector({
    Key? key,
    required this.previewUpdateNotifier,
    required this.size,
    this.onScroll,
  }) : super(key: key);

  double get maxRemainingFactor => 1 - previewUpdateNotifier.value.previewWidthFraction;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: previewUpdateNotifier,
            builder: (context, child) => ClipPath(
              clipper: CropInnerAreaClipper(
                Rect.fromLTWH(
                  previewUpdateNotifier.value.leftOffset + 6,
                  2,
                  size.width * previewUpdateNotifier.value.previewWidthFraction - 12,
                  size.height - 4,
                ),
                4,
              ),
              child: child,
            ),
            child: ColoredBox(
              color: ColorsFoundation.neutral16,
            ),
          ),
          AnimatedBuilder(
            animation: previewUpdateNotifier,
            builder: (context, child) {
              return Positioned(
                left: previewUpdateNotifier.value.leftOffset,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onPanUpdate: (details) {
                    double newOffset = previewUpdateNotifier.value.leftOffset + details.delta.dx;
                    if (newOffset <= 0) newOffset = 0;
                    if (newOffset > (size.width * maxRemainingFactor)) newOffset = (size.width * maxRemainingFactor);

                    previewUpdateNotifier.value = previewUpdateNotifier.value.copyWith(leftOffset: newOffset);
                    final atEnd = newOffset >= (size.width * maxRemainingFactor) - 12 &&
                        previewUpdateNotifier.value.leftOffset >= (size.width * maxRemainingFactor) - 12;
                    double scrollOffset = newOffset + 16;
                    if (newOffset == 0) scrollOffset = 0;
                    if (atEnd) return;
                    onScroll?.call(scrollOffset);
                  },
                  onPanEnd: (details) {
                    final atEnd = previewUpdateNotifier.value.leftOffset >= (size.width * maxRemainingFactor) - 12;
                    if (atEnd) {
                      onScroll?.call(double.infinity);
                    }
                  },
                  child: AnimatedBuilder(
                    animation: previewUpdateNotifier,
                    builder: (context, child) {
                      return ClipPath(
                        clipper: CropInnerAreaClipper(
                          Rect.fromLTWH(
                            12,
                            2,
                            size.width * previewUpdateNotifier.value.previewWidthFraction - 24,
                            size.height - 4,
                          ),
                          4,
                        ),
                        child: Container(
                          width: size.width * previewUpdateNotifier.value.previewWidthFraction,
                          height: size.height,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: ColorsFoundation.darkNeutral900,
                            ),
                            color: ColorsFoundation.darkNeutral900,
                            borderRadius: BorderRadiusFoundation.all4,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onPanUpdate: (details) {
                                  final currentPreviewViewportWidth =
                                      size.width * previewUpdateNotifier.value.previewWidthFraction;
                                  final currentLeftOffset = previewUpdateNotifier.value.leftOffset;

                                  /// need to calculate the new width fraction based
                                  /// on the current preview viewport width and the delta
                                  /// of the pan
                                  final newWidthFraction =
                                      (currentPreviewViewportWidth - details.delta.dx) / size.width;
                                  final panLeft = details.delta.dx.isNegative;
                                  double newLeftOffset = 0;

                                  /// need to change offset based on pan direction
                                  /// if pan left then we need to increase the offset
                                  /// if pan right then we need to decrease the offset
                                  if (panLeft) {
                                    /// because delta is always negative when panning left
                                    /// we need to use abs to get the positive value
                                    newLeftOffset = currentLeftOffset - details.delta.dx.abs();
                                  } else {
                                    /// there is no need to get the abs value because delta is always positive
                                    /// when panning right
                                    newLeftOffset = currentLeftOffset + details.delta.dx;
                                  }

                                  if (newWidthFraction >= 0.2 &&
                                      newWidthFraction <= 1 &&
                                      newLeftOffset >= 0 &&
                                      newLeftOffset <= (size.width * maxRemainingFactor)) {
                                    previewUpdateNotifier.value = previewUpdateNotifier.value.copyWith(
                                      previewWidthFraction: newWidthFraction,
                                      leftOffset: newLeftOffset,
                                    );
                                  }
                                },
                                child: Container(
                                  width: 4,
                                  height: SpacingFoundation.verticalSpacing8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadiusFoundation.max,
                                  ),
                                ).paddingOnly(left: 2),
                              ),
                              GestureDetector(
                                onPanUpdate: (details) {
                                  final currentWidth = size.width * previewUpdateNotifier.value.previewWidthFraction;
                                  final newWidthFraction = (currentWidth + details.delta.dx) / size.width;
                                  if (newWidthFraction >= 0.2 && newWidthFraction <= 1) {
                                    previewUpdateNotifier.value = previewUpdateNotifier.value.copyWith(
                                      previewWidthFraction: newWidthFraction,
                                    );
                                  }
                                },
                                child: Container(
                                  width: 4,
                                  height: SpacingFoundation.verticalSpacing8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadiusFoundation.max,
                                  ),
                                ).paddingOnly(right: 2),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
