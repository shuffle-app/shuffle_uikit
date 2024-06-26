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

    double depthScale = 0.1; // Adjust this scale factor based on desired sensitivity

    for (int x = 0; x < imageWidth; x += 10) {
      // Adjust segment size as needed
      for (int y = 0; y < imageHeight; y += 10) {
        double depth = getDepthFromMap(x, y, imageWidth, depthData);

        double offsetX = tiltX * depth * depthScale;
        double offsetY = tiltY * depth * depthScale;

        final src = Rect.fromLTWH(x.toDouble(), y.toDouble(), 10, 10); // Segment size
        final dst = src.shift(Offset(offsetX, offsetY));

        canvas.drawImageRect(mainImage, src, dst, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

double getDepthFromMap(int x, int y, int width, List<double> depthData) {
  int index = x + y * width; // Calculate index assuming row-major order
  return depthData[index]; // Return depth value from the list
}
