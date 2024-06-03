import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';
import 'package:shuffle_uikit/utils/extentions/chart_extensions.dart';

class LineChartPainter extends CustomPainter {
  final List<UiKitLineChartItemData<num>> lines;
  late final double step;
  final Size size;

  LineChartPainter({
    super.repaint,
    required this.lines,
    required this.size,
    double? step,
  }) {
    this.step = step ?? ((size.width + ((lines.dates.length - 1) * SpacingFoundation.horizontalSpacing4)) / lines.dates.length);
  }

  double get curvatureRadius => step / 2;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final maxValue = lines.maxValue;
    for (final lineData in lines) {
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
        if (i == 0) path.moveTo(currentX - (curvatureRadius / 2), currentY);

        /// adding some space to see the line to the point
        if (currentY == height) currentY = height - SpacingFoundation.verticalSpacing2;
        if (nextY == height) nextY = height - SpacingFoundation.verticalSpacing2;

        if (isLastDataSet) nextY += 4;

        double midY = nextY;
        double midX = nextX - curvatureRadius;
        currentX += curvatureRadius;

        path.cubicTo(currentX, currentY, midX, midY, nextX, nextY);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
