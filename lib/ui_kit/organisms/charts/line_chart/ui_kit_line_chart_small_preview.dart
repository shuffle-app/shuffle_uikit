import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/organisms/charts/painters/line_chart_painters.dart';
import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';
import 'package:shuffle_uikit/utils/extentions/chart_extensions.dart';

class UiKitLineChartSmallPreview extends StatelessWidget {
  final ValueNotifier<double> smallPreviewLeftOffsetNotifier;
  final List<UiKitLineChartItemData<num>> chartItems;
  final ValueChanged<double>? onScroll;
  final Size size;

  const UiKitLineChartSmallPreview({
    super.key,
    required this.smallPreviewLeftOffsetNotifier,
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
              leftOffsetNotifier: smallPreviewLeftOffsetNotifier,
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
  final ValueNotifier<double> leftOffsetNotifier;

  const UiKitLineChartSmallPreviewOverlay({
    Key? key,
    required this.leftOffsetNotifier,
    required this.size,
    this.onScroll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: leftOffsetNotifier,
            builder: (context, child) => ClipPath(
              clipper: CropInnerAreaClipper(
                Rect.fromLTWH(leftOffsetNotifier.value + 6, 2, size.width * 0.35 - 12, size.height - 4),
                4,
              ),
              child: child,
            ),
            child: ColoredBox(
              color: ColorsFoundation.neutral16,
            ),
          ),
          AnimatedBuilder(
            animation: leftOffsetNotifier,
            builder: (context, child) {
              return Positioned(
                left: leftOffsetNotifier.value,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onPanUpdate: (details) {
                    double newOffset = leftOffsetNotifier.value + details.delta.dx;
                    if (newOffset <= 0) newOffset = 0;
                    if (newOffset >= (size.width * 0.65)) newOffset = (size.width * 0.65);

                    leftOffsetNotifier.value = newOffset;
                    final atEnd = newOffset >= (size.width * 0.65) - 12 && leftOffsetNotifier.value >= (size.width * 0.65) - 12;
                    double scrollOffset = newOffset + 12;
                    if (newOffset == 0) scrollOffset = 0;
                    if (!atEnd) onScroll?.call(scrollOffset);
                  },
                  child: AnimatedBuilder(
                    animation: leftOffsetNotifier,
                    builder: (context, child) {
                      return ClipPath(
                        clipper: CropInnerAreaClipper(
                          Rect.fromLTWH(12, 2, size.width * 0.35 - 24, size.height - 4),
                          4,
                        ),
                        child: Container(
                          width: size.width * 0.35,
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
                              Container(
                                width: SpacingFoundation.horizontalSpacing2,
                                height: SpacingFoundation.verticalSpacing8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadiusFoundation.max,
                                ),
                              ).paddingOnly(left: SpacingFoundation.horizontalSpacing2),
                              Container(
                                width: SpacingFoundation.horizontalSpacing2,
                                height: SpacingFoundation.verticalSpacing8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadiusFoundation.max,
                                ),
                              ).paddingOnly(right: SpacingFoundation.horizontalSpacing2),
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
