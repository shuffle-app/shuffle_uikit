import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GradientLinearIndicator extends StatelessWidget {
  final double actualSum;
  final double sum;
  final double? width;

  GradientLinearIndicator({
    super.key,
    required this.actualSum,
    required this.sum,
    this.width,
  });

  late final double _indicatorWidth = width ?? 256.w;

  double get _progressPosition => _indicatorWidth * (_progressValue / 120);
  double get _progressValue => ((actualSum / sum) * 120);

  double _getCurrentPosition(double currentPosition) {
    if (currentPosition > _indicatorWidth) {
      return _indicatorWidth;
    }

    return currentPosition;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;

    return ClipRRect(
      borderRadius: BorderRadiusFoundation.all40,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          ColoredBox(
            color: colorScheme?.surface3 ?? Colors.white,
            child: SizedBox(
              height: 6.h,
              width: _indicatorWidth,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedContainer(
                  width: _getCurrentPosition(_progressPosition),
                  curve: Curves.ease,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusFoundation.all40,
                    gradient: GradientFoundation.touchIdLinearGradient,
                    color: Colors.white,
                  ),
                  duration: const Duration(milliseconds: 300),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
