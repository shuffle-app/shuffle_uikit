import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_models/charts/pie_chart_data.dart';
import 'package:shuffle_uikit/utils/extentions/pie_chart_extensions.dart';

class UiKitPieChartPainter extends CustomPainter {
  final double strokeWidth;
  final List<UiKitPieCharItemData> data;

  const UiKitPieChartPainter({
    required this.data,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final diameter = min(size.width - strokeWidth, size.height - strokeWidth);
    final radius = diameter / 2;
    double startAngle = 0;

    for (final item in data) {
      final sweepAngle = (item.value / data.sum) * 2 * pi;

      final paint = Paint()
        ..color = item.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;
      canvas.drawArc(
        Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(UiKitPieChartPainter oldDelegate) => data != oldDelegate.data;
}
