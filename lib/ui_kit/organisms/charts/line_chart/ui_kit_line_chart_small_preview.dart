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

  void _listener() {
    if (widget.leftOffsetNotifier.value >= widget.size.width * 0.65 - 8) {
      widget.leftOffsetNotifier.value = widget.size.width * 0.65 - 8;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: widget.size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanUpdate: (details) {
              double newOffset = widget.leftOffsetNotifier.value + details.delta.dx;
              if (newOffset <= 8 && newOffset >= 0) {
                newOffset = 8;
                widget.onScroll?.call(0);
              } else if (newOffset >= (widget.size.width * 0.65) - 8) {
                newOffset = (widget.size.width * 0.65) - 8;
              } else {
                widget.leftOffsetNotifier.value = newOffset;
                widget.onScroll?.call(newOffset - 8);
              }
            },
            child: AnimatedBuilder(
              animation: widget.leftOffsetNotifier,
              builder: (context, child) => ClipPath(
                clipper: CropInnerAreaClipper(
                  Rect.fromLTWH(widget.leftOffsetNotifier.value, 2, widget.size.width * 0.35, widget.size.height - 4),
                  4,
                ),
                child: child,
              ),
              child: ColoredBox(
                color: ColorsFoundation.neutral16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
