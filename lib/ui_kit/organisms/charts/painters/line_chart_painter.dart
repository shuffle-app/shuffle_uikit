import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LineChartPainterWithInfoOverlay extends CustomPainter {
  final List<UiKitLineChartItemData<num>> lines;
  late final double _step;
  final Size size;
  final int? selectedIndex;
  final double stepScaleFactor;
  final Color pointsStraightLineColor;
  final List<int> visibleLinesIds;

  LineChartPainterWithInfoOverlay({
    super.repaint,
    required this.lines,
    required this.size,
    required this.pointsStraightLineColor,
    required this.visibleLinesIds,
    double? step,
    this.selectedIndex,
    this.stepScaleFactor = 1,
  }) {
    _step =
        step ?? ((size.width + ((lines.dates.length - 1) * SpacingFoundation.horizontalSpacing4)) / lines.dates.length);
  }

  double get step => _step * stepScaleFactor;

  double get curvatureRadius => step / 2;

  double get pointCircleRadius => 4;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    if (lines.isEmpty) return;

    final innerPaint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    final maxValue = lines.maxValue;
    for (final lineData in lines) {
      if (!visibleLinesIds.contains(lineData.id)) continue;
      final path = Path();
      final paint = Paint()
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;

      if (lineData.gradient != null) {
        paint.shader = lineData.gradient!.createShader(Rect.fromLTWH(0, 0, width, height));
      } else if (lineData.color != null) {
        paint.color = lineData.color!;
      }
      for (int i = 0; i < lineData.datasets.length - 1; i++) {
        final isLastDataSet = i + 1 == lineData.datasets.length - 1;
        final currentValue = lineData.datasets.elementAt(i).value;
        final nextValue = lineData.datasets.elementAt(i + 1).value;
        double currentX = (i * step);
        double nextX = (i + 1) * step;
        double currentY = height - ((currentValue / maxValue) * height);
        double nextY = height - ((nextValue / maxValue) * height);
        if (i == 0) path.moveTo(currentX - (curvatureRadius / 2), currentY - 4);

        /// adding some space to see the line to the point
        if (currentY >= height) currentY = height - SpacingFoundation.verticalSpacing2;
        if (nextY >= height) nextY = height - SpacingFoundation.verticalSpacing2;
        if (currentY <= 0) currentY = SpacingFoundation.verticalSpacing2;
        if (nextY <= 0) nextY = SpacingFoundation.verticalSpacing2;

        if (isLastDataSet) nextY += 4;

        double midY = nextY;
        double midX = nextX - curvatureRadius;
        currentX += curvatureRadius;

        path.cubicTo(currentX, currentY, midX, midY, nextX, nextY);
      }
      canvas.drawPath(path, paint);
    }
    if (selectedIndex != null && selectedIndex! >= 0) {
      final chartLines =
          lines.where((line) => visibleLinesIds.contains(line.id)).toList().chartItemsWithDatasetAt(selectedIndex!);
      final currentX = selectedIndex! * step;
      final lastDataSet = selectedIndex! == lines.maxDatasetsCount - 1;
      for (final line in chartLines) {
        final borderPaint = Paint()
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;
        if (line.gradient != null) {
          borderPaint.shader = line.gradient!.createShader(Rect.fromLTWH(0, 0, width, height));
        } else if (line.color != null) {
          borderPaint.color = line.color!;
        }
        final currentValue = line.datasets.first.value;
        double currentY = height - ((currentValue / maxValue) * height);
        if (currentY == height) currentY -= curvatureRadius / 8;

        final pointOffset = Offset(
          lastDataSet ? currentX - (pointCircleRadius * 1.5) : currentX,
          lastDataSet
              ? currentY + (pointCircleRadius * 1.5)
              : currentY - (selectedIndex == 0 ? curvatureRadius / 8 : 0),
        );

        canvas.drawCircle(pointOffset, pointCircleRadius, innerPaint);
        canvas.drawCircle(pointOffset, pointCircleRadius, borderPaint);
      }
      final x = lastDataSet ? currentX - (pointCircleRadius * 1.5) : currentX;
      canvas.drawLine(
        Offset(x, height),
        Offset(x, 0),
        Paint()
          ..color = pointsStraightLineColor
          ..strokeWidth = 0.5
          ..style = PaintingStyle.stroke,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
