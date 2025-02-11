import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_models/charts/line_chart_small_preview_data.dart';

class UiKitLineChartSmallPreview extends StatelessWidget {
  final ValueNotifier<LineChartSmallPreviewData> smallPreviewUpdateNotifier;
  final List<UiKitLineChartItemData<num>> chartItems;
  final ValueChanged<double>? onScroll;
  final Size size;
  final double? initialPreviewWidthFraction;

  const UiKitLineChartSmallPreview({
    super.key,
    required this.smallPreviewUpdateNotifier,
    required this.chartItems,
    required this.size,
    this.onScroll,
    this.initialPreviewWidthFraction,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;

    return SizedBox.fromSize(
      size: size,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadiusFoundation.all4,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              top: SpacingFoundation.verticalSpacing2,
              left: SpacingFoundation.horizontalSpacing2,
              child: CustomPaint(
                isComplex: true,
                willChange: false,
                size: Size(size.width, size.height - SpacingFoundation.verticalSpacing6),
                painter: LineChartPainterWithInfoOverlay(
                  pointsStraightLineColor: colorScheme?.inverseSurface ?? Colors.white,
                  size: size,
                  lines: chartItems,
                  step: (size.width) / chartItems.maxDatasetsCount,
                  visibleLinesIds: smallPreviewUpdateNotifier.value.visibleLinesIds,
                ),
              ),
            ),
            UiKitLineChartSmallPreviewOverlay(
                size: size,
                onScroll: onScroll,
                previewUpdateNotifier: smallPreviewUpdateNotifier,
                initialPreviewWidthFraction: initialPreviewWidthFraction ?? 0),
          ],
        ),
      ),
    );
  }
}

class UiKitLineChartSmallPreviewOverlay extends StatelessWidget {
  final Size size;
  final ValueChanged<double>? onScroll;
  final ValueNotifier<LineChartSmallPreviewData> previewUpdateNotifier;
  final double initialPreviewWidthFraction;

  const UiKitLineChartSmallPreviewOverlay({
    super.key,
    required this.previewUpdateNotifier,
    required this.size,
    this.onScroll,
    this.initialPreviewWidthFraction = 0,
  });

  List<double> get fractionBounds => [0.1, maxPossibleWidthFraction];

  double get maxRemainingFactor => 1 - previewUpdateNotifier.value.previewWidthFraction;

  double get maxPossibleWidthFraction => 1 - previewUpdateNotifier.value.leftOffset / size.width;

  List<double> get offsetBounds => [0, size.width * maxRemainingFactor];

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
                  previewUpdateNotifier.value.leftOffset,
                  2,
                  size.width * previewUpdateNotifier.value.previewWidthFraction,
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
                    if (previewUpdateNotifier.value.previewWidthFraction >= 0.99) return;
                    double newOffset = previewUpdateNotifier.value.leftOffset + details.delta.dx;
                    if (newOffset <= 0) newOffset = 0;
                    if (newOffset > (size.width * maxRemainingFactor)) newOffset = (size.width * maxRemainingFactor);

                    previewUpdateNotifier.value = previewUpdateNotifier.value.copyWith(leftOffset: newOffset);
                    if (previewUpdateNotifier.value.atEdge && previewUpdateNotifier.value.leftOffset == 0) return;
                    final atEnd = newOffset >= (size.width * maxRemainingFactor) &&
                        previewUpdateNotifier.value.leftOffset >= (size.width * maxRemainingFactor);
                    // double scrollOffset = newOffset + 16;
                    double scrollOffset = newOffset;
                    if (newOffset == 0) scrollOffset = double.nan;
                    // if (atEnd) scrollOffset = double.infinity;
                    // if (atEnd) scrollOffset = size.width;
                    onScroll?.call(scrollOffset);
                    previewUpdateNotifier.value = previewUpdateNotifier.value.copyWith(atEdge: atEnd || newOffset == 0);
                  },
                  // onPanEnd: (details) {
                  //   if (previewUpdateNotifier.value.previewWidthFraction >= 0.99) return;
                  //   final atEnd = previewUpdateNotifier.value.leftOffset >= (size.width * maxRemainingFactor) - 12;
                  //   if (atEnd) {
                  //     onScroll?.call(double.infinity);
                  //   }
                  // },
                  child: AnimatedBuilder(
                    animation: previewUpdateNotifier,
                    builder: (context, child) {
                      return ClipPath(
                        clipper: CropInnerAreaClipper(
                          Rect.fromLTWH(
                            12,
                            2,
                            size.width * previewUpdateNotifier.value.previewWidthFraction -
                                (previewUpdateNotifier.value.previewWidthFraction < 1 ? 24 : 0),
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
                                behavior: HitTestBehavior.opaque,
                                onPanUpdate: (details) {
                                  final currentPreviewViewportWidth =
                                      size.width * previewUpdateNotifier.value.previewWidthFraction;
                                  final currentLeftOffset = previewUpdateNotifier.value.leftOffset;

                                  /// need to calculate the new width fraction based
                                  /// on the current preview viewport width and the delta
                                  /// of the pan
                                  final newWidthFraction =
                                      (currentPreviewViewportWidth - details.delta.dx) / size.width;
                                  if (newWidthFraction <= initialPreviewWidthFraction) {
                                    return;
                                  }
                                  final panLeft = details.delta.dx.isNegative;
                                  double newLeftOffset = 0;

                                  final withinFractionBounds = newWidthFraction >= fractionBounds.first &&
                                      newWidthFraction <= fractionBounds.last;
                                  final widthDifference =
                                      (previewUpdateNotifier.value.previewWidthFraction - newWidthFraction) *
                                          size.width;

                                  /// need to change offset based on pan direction
                                  /// if pan right then we need to increase the offset
                                  /// if pan left then we need to decrease the offset
                                  if (panLeft) {
                                    /// because delta is always negative when panning left
                                    /// we need to use abs to get the positive value
                                    newLeftOffset = currentLeftOffset - details.delta.dx.abs();
                                  } else {
                                    /// there is no need to get the abs value because delta is always positive
                                    /// when panning right
                                    if (withinFractionBounds && -details.delta.dx < currentLeftOffset) {
                                      newLeftOffset = currentLeftOffset + widthDifference;
                                    } else {
                                      newLeftOffset = currentLeftOffset + details.delta.dx;
                                    }

                                    //adding the difference in width to the current offset
                                  }

                                  final withinOffsetBounds =
                                      newLeftOffset >= offsetBounds.first && newLeftOffset <= offsetBounds.last;
                                  if (withinFractionBounds && newLeftOffset >= 0) {
                                    previewUpdateNotifier.value = previewUpdateNotifier.value.copyWith(
                                      previewWidthFraction: newWidthFraction,
                                    );
                                  }
                                  if (withinOffsetBounds && newWidthFraction >= fractionBounds.first) {
                                    previewUpdateNotifier.value = previewUpdateNotifier.value.copyWith(
                                      leftOffset: newLeftOffset,
                                    );

                                    /// send changes in offset to parent
                                    onScroll?.call(newLeftOffset);
                                  }
                                },
                                child: SizedBox(
                                  height: size.height,
                                  width: 12,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 4,
                                      height: SpacingFoundation.verticalSpacing8,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadiusFoundation.max,
                                      ),
                                    ).paddingOnly(left: 2),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onPanUpdate: (details) {
                                  final currentWidth = size.width * previewUpdateNotifier.value.previewWidthFraction;
                                  final newWidthFraction = (currentWidth + details.delta.dx) / size.width;
                                  if (newWidthFraction <= initialPreviewWidthFraction) {
                                    return;
                                  }
                                  if (newWidthFraction >= fractionBounds.first &&
                                      newWidthFraction <= fractionBounds.last) {
                                    previewUpdateNotifier.value = previewUpdateNotifier.value.copyWith(
                                      previewWidthFraction: newWidthFraction,
                                    );
                                  }
                                },
                                child: SizedBox(
                                  height: size.height,
                                  width: 12,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      width: 4,
                                      height: SpacingFoundation.verticalSpacing8,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadiusFoundation.max,
                                      ),
                                    ).paddingOnly(right: 2),
                                  ),
                                ),
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
