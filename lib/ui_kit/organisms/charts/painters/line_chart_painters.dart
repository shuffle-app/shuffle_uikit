import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';
import 'package:shuffle_uikit/utils/extentions/chart_extensions.dart';

class LineChartPainter extends CustomPainter {
  final List<UiKitLineChartItemData<num>> lines;

  LineChartPainter({
    super.repaint,
    required this.lines,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final maxValue = lines.maxValue;
    for (final lineData in lines) {
      final path = Path();
      final paint = Paint()
        ..color = lineData.color
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;
      final step = SpacingFoundation.horizontalSpacing32 * 2;
      for (int i = 0; i < lineData.datasets.length - 1; i++) {
        print('i: $i, value: ${lineData.datasets.elementAt(i).value}');
        final currentDataset = lineData.datasets.elementAt(i);
        final nextDataset = lineData.datasets.elementAt(i + 1);
        final currentValue = currentDataset.value;
        final nextValue = nextDataset.value;
        double currentHeight = (currentValue / maxValue) * height;

        /// adding some space to see the line to the point
        if (currentHeight == height) currentHeight = height - SpacingFoundation.verticalSpacing2;
        double nextHeight = (nextValue / maxValue) * height;

        /// adding some space to see the line to the point
        if (nextHeight == height) nextHeight = height - SpacingFoundation.verticalSpacing2;

        double currentX = (i * step);
        double nextX = (i + 1) * step;
        double currentY = currentHeight;
        double nextY = nextHeight;

        if (i == 0) path.moveTo(0, height);

        double midY = 0;
        double midX = 0;
        print('currentY: ${currentY.toStringAsFixed(1)}, nextY: ${nextY.toStringAsFixed(1)}');

        if (nextY > currentY) {
          midX = nextX - SpacingFoundation.verticalSpacing16;
          midY = nextY + SpacingFoundation.verticalSpacing16;
        } else if (currentY > nextY) {
          midY = nextY - SpacingFoundation.verticalSpacing16;
          midX = currentX + (step / 2);
        }
        currentY = height - currentY;
        nextY = height - nextY;
        midY = height - midY;

        path.cubicTo(currentX, currentY, midX, midY, nextX, nextY);
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
