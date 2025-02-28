import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WaveformPainter extends CustomPainter {
  final List<double> waveData;
  final double progress;

  static const _maxBars = 45;
  static const _minBarHeight = 3.0;
  static const _maxBarHeight = 24.0;
  static const _barBorderRadius = 2.0;

  WaveformPainter(this.waveData, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    if (waveData.isEmpty) return;

    final paint = Paint()..style = PaintingStyle.fill;
    final processedData = _processWaveData(waveData, size);

    for (var i = 0; i < processedData.length; i++) {
      final (x, barWidth, barHeight) = processedData[i];
      final isPlayed = (i / processedData.length) < progress;

      paint.color = isPlayed ? Colors.white : Colors.grey.withValues(alpha: 0.4);

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, (size.height - barHeight) / 2, barWidth, barHeight),
          const Radius.circular(_barBorderRadius),
        ),
        paint,
      );
    }
  }

  List<(double, double, double)> _processWaveData(List<double> data, Size size) {
    final maxValue = data.reduce(max).clamp(1.0, double.infinity);
    final normalized = data.map((v) => v / maxValue).toList();

    final aggregated = _aggregateData(normalized, _maxBars);

    final (barWidth, spacing) = _calculateDimensions(size.width, _maxBars);
    final result = <(double, double, double)>[];

    for (var i = 0; i < _maxBars; i++) {
      final x = i * (barWidth + spacing);
      final height = (aggregated[i] * _maxBarHeight).clamp(_minBarHeight, _maxBarHeight);

      if (x + barWidth > size.width) break;

      result.add((x, barWidth, height));
    }

    return result;
  }

  List<double> _aggregateData(List<double> data, int targetCount) {
    if (data.isEmpty || targetCount == 0) return List.filled(targetCount, 0.0);

    final result = List<double>.filled(targetCount, 0.0);
    final dataLength = data.length.toDouble();

    for (int i = 0; i < targetCount; i++) {
      final start = i * dataLength / targetCount;
      final end = (i + 1) * dataLength / targetCount;
      double sum = 0.0;

      final jStart = start.floor();
      final jEnd = end.ceil();

      for (int j = jStart; j < jEnd; j++) {
        if (j < 0 || j >= data.length) continue;

        final overlapStart = max(start, j.toDouble());
        final overlapEnd = min(end, (j + 1).toDouble());
        final overlap = overlapEnd - overlapStart;

        if (overlap > 0) {
          sum += data[j] * overlap;
        }
      }

      final blockLength = end - start;
      result[i] = blockLength > 0 ? sum / blockLength : 0.0;
    }

    return result;
  }

  (double, double) _calculateDimensions(double availableWidth, int count) {
    final widthPerElement = availableWidth / count;
    return (widthPerElement * 0.65, widthPerElement * 0.3);
  }

  @override
  bool shouldRepaint(covariant WaveformPainter oldDelegate) {
    return (oldDelegate.progress - progress).abs() > 0.001 || !listEquals(oldDelegate.waveData, waveData);
  }
}
