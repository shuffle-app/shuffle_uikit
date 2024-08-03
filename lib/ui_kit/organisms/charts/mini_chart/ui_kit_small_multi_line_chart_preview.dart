import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/organisms/charts/line_chart/ui_kit_line_chart_small_preview.dart';
import 'package:shuffle_uikit/ui_models/charts/line_chart_small_preview_data.dart';

class UiKitSmallMultiLineChartPreview extends StatelessWidget {
  final List<CustomPainter> linePainters;
  final Size size;
  final ValueChanged<double>? onScroll;

  const UiKitSmallMultiLineChartPreview({
    Key? key,
    required this.linePainters,
    required this.size,
    this.onScroll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: ClipRRect(
        borderRadius: BorderRadiusFoundation.all4,
        clipBehavior: Clip.hardEdge,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.hardEdge,
          children: [
            ...linePainters.map(
              (e) => Positioned(
                left: SpacingFoundation.verticalSpacing12,
                top: SpacingFoundation.verticalSpacing4,
                child: CustomPaint(
                  painter: e,
                  size: Size(size.width, size.height - SpacingFoundation.verticalSpacing6),
                ),
              ),
            ),
            UiKitLineChartSmallPreviewOverlay(
              size: size,
              previewUpdateNotifier: ValueNotifier(LineChartSmallPreviewData.initial()),
              onScroll: onScroll,
            ),
          ],
        ),
      ),
    );
  }
}
