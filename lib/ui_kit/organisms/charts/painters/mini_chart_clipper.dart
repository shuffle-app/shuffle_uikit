import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/utils/extentions/mini_chart_extension.dart';

class MiniChartClipper extends CustomClipper<Path> {
  final List<UiKitMiniChartDataItem> data;

  MiniChartClipper({
    required this.data,
  });

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final step = width / data.length;
    final curvatureRadius = step / 2;
    final maxValue = data.maxValue;

    final path = Path();

    for (int i = 0; i < data.length - 1; i++) {
      final isLastDataSet = i + 1 == data.length - 1;
      final currentValue = data.elementAt(i).value;
      final nextValue = data.elementAt(i + 1).value;
      double currentX = (i * step);
      double nextX = (i + 1) * step;
      double currentY = height - ((currentValue / maxValue) * height);
      double nextY = height - ((nextValue / maxValue) * height);
      if (i == 0) path.moveTo(currentX, currentY);

      /// adding some space to see the line to the point
      if (currentY == height) currentY = height - SpacingFoundation.verticalSpacing2;
      if (nextY == height) nextY = height - SpacingFoundation.verticalSpacing4;

      if (isLastDataSet) nextY += 4;

      double midY = nextY;
      double midX = nextX - curvatureRadius;
      currentX += curvatureRadius;

      path.cubicTo(currentX, currentY, midX, midY, nextX, nextY);
      if (isLastDataSet) {
        path.lineTo(nextX, height);
        path.lineTo(0, height);
        path.close();
      }
    }

    return path;
  }

  @override
  bool shouldReclip(covariant MiniChartClipper oldClipper) => oldClipper.data != data;
}
