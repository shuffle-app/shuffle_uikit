import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/organisms/charts/painters/line_chart_painters.dart';
import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';
import 'package:shuffle_uikit/ui_models/charts/line_chart_small_preview_data.dart';
import 'package:shuffle_uikit/utils/extentions/chart_extensions.dart';

class UiKitLineChartSmallPreview extends StatelessWidget {
  final ValueNotifier<LineChartSmallPreviewData> smallPreviewUpdateNotifier;
  final List<UiKitLineChartItemData<num>> chartItems;
  final ValueChanged<double>? onScroll;
  final Size size;

  const UiKitLineChartSmallPreview({
    super.key,
    required this.smallPreviewUpdateNotifier,
    required this.chartItems,
    required this.size,
    this.onScroll,
  });

  @override
  Widget build(BuildContext context) {
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
              left: SpacingFoundation.verticalSpacing12,
              child: CustomPaint(
                isComplex: true,
                willChange: false,
                size: size,
                painter: LineChartPainter(
                  size: size,
                  lines: chartItems,
                  step: (size.width) / chartItems.maxDatasetsCount,
                ),
              ),
            ),
            UiKitLineChartSmallPreviewOverlay(
              size: size,
              onScroll: onScroll,
              previewUpdateNotifier: smallPreviewUpdateNotifier,
            ),
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

  const UiKitLineChartSmallPreviewOverlay({
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
                    if (newOffset >= (size.width * maxRemainingFactor)) newOffset = (size.width * maxRemainingFactor);

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
                                  print(details.delta.dx);
                                  final currentWidth = size.width * previewUpdateNotifier.value.previewWidthFraction;
                                  final newWidthFraction = (currentWidth + details.delta.dx) / size.width;
                                  double newLeftOffset = 0;
                                  if (details.delta.dx.isNegative) {
                                    newLeftOffset = previewUpdateNotifier.value.leftOffset + details.delta.dx;
                                  } else {
                                    newLeftOffset = previewUpdateNotifier.value.leftOffset;
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
                                  print(details.delta.dx);
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
