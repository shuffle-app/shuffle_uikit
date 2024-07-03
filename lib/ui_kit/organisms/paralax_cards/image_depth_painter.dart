import 'dart:ui' as ui;

import 'package:flutter/material.dart' hide Image;

class DepthMapPainter extends CustomPainter {
  final ui.FragmentProgram program;
  final ui.Image image;
  final ui.Image depthMap;
  final double tiltX;
  final double tiltY;

  DepthMapPainter({
    required this.program,
    required this.image,
    required this.depthMap,
    required this.tiltX,
    required this.tiltY,
  });

  @override
  void paint(Canvas canvas, Size size) async {
    final paint = Paint();

    final fragmentShader = program.fragmentShader()
      ..setFloat(0, tiltX)
      ..setFloat(1, tiltY)
      ..setImageSampler(0, image)
      ..setImageSampler(1, depthMap);

    paint.shader = fragmentShader;

    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
