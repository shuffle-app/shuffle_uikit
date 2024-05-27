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

class UiKitLineChartSmallPreviewOverlay extends StatefulWidget {
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
  State<UiKitLineChartSmallPreviewOverlay> createState() => _UiKitLineChartSmallPreviewOverlayState();
}

class _UiKitLineChartSmallPreviewOverlayState extends State<UiKitLineChartSmallPreviewOverlay> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) {
      widget.leftOffsetNotifier.addListener(_listener);
    });
  }

  void _listener() {}

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: widget.size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: widget.leftOffsetNotifier,
            builder: (context, child) => ClipPath(
              clipper: CropInnerAreaClipper(
                Rect.fromLTWH(widget.leftOffsetNotifier.value - 8, 2, widget.size.width * 0.35 - 8, widget.size.height - 4),
                4,
              ),
              child: child,
            ),
            child: ColoredBox(
              color: ColorsFoundation.neutral16,
            ),
          ),
          AnimatedPositioned(
            left: widget.leftOffsetNotifier.value - 8,
            duration: const Duration(milliseconds: 10),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanUpdate: (details) {
                double newOffset = widget.leftOffsetNotifier.value + details.delta.dx;
                if (newOffset <= 8) newOffset = 8;
                if (newOffset >= (widget.size.width * 0.65) + 8) newOffset = (widget.size.width * 0.65) + 8;

                widget.leftOffsetNotifier.value = newOffset;
                widget.onScroll?.call(newOffset - 8);
              },
              child: AnimatedBuilder(
                animation: widget.leftOffsetNotifier,
                builder: (context, child) {
                  return ClipPath(
                    clipper: CropInnerAreaClipper(
                      Rect.fromLTWH(8, 2, widget.size.width * 0.35 - 16, widget.size.height - 4),
                      4,
                    ),
                    child: Container(
                      width: widget.size.width * 0.35,
                      height: widget.size.height,
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
                          ).paddingOnly(left: 1),
                          Container(
                            width: SpacingFoundation.horizontalSpacing2,
                            height: SpacingFoundation.verticalSpacing8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadiusFoundation.max,
                            ),
                          ).paddingOnly(right: 1),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
