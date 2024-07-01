import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class DepthPainter extends CustomPainter {
  final ui.Image mainImage;
  final List<double> depthData;
  final double tiltX;
  final double tiltY;

  DepthPainter({
    required this.mainImage,
    required this.depthData,
    required this.tiltX,
    required this.tiltY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final imageWidth = mainImage.width;
    final imageHeight = mainImage.height;
    final paint = Paint();

    double depthScale = 2; // Adjust this scale factor based on desired sensitivity

    const int segmentSize = 10;
    const double overlap = 5.0; // Additional pixels to overlap segments

    for (int y = 0; y < imageHeight; y += segmentSize) {
      for (int x = 0; x < imageWidth; x += segmentSize) {
        int index = x + y * imageWidth; // Calculate index in the depthData
        double depth = depthData[index]; // Get the depth value

        double offsetX = tiltX * depth * depthScale;
        double offsetY = tiltY * depth * depthScale;

        // Adjusted source rectangle to slightly larger to cover gaps
        final src = Rect.fromLTWH(
            x.toDouble(), y.toDouble(), segmentSize.toDouble() + overlap, segmentSize.toDouble() + overlap);

        // Calculate the shifted destination rectangle
        final dstX = x + offsetX;
        final dstY = y + offsetY;
        final dst = Rect.fromLTWH(dstX, dstY, segmentSize.toDouble() + overlap, segmentSize.toDouble() + overlap);

        // Make sure we do not draw outside the bounds of the original image
        if (dst.right <= imageWidth && dst.bottom <= imageHeight) {
          canvas.drawImageRect(mainImage, src, dst, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(DepthPainter oldDelegate) =>
      tiltX != oldDelegate.tiltX || tiltY != oldDelegate.tiltY || mainImage != oldDelegate.mainImage;
}

double getDepthFromMap(int x, int y, int width, List<double> depthData) {
  int index = x + y * width; // Calculate index assuming row-major order
  return depthData[index]; // Return depth value from the list
}
