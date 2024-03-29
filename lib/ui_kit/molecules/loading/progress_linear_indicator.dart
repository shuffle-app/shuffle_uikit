import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProgressLinearIndicator extends StatefulWidget {
  const ProgressLinearIndicator({
    super.key,
    required this.actualSum,
    required this.sum,
    this.width,
    required this.onTap,
  });

  final double actualSum;
  final double sum;
  final double? width;
  final VoidCallback onTap;

  @override
  State<ProgressLinearIndicator> createState() => _ProgressLinearIndicatorState();
}

class _ProgressLinearIndicatorState extends State<ProgressLinearIndicator> {
  late double _progressPosition;
  late final double _progressValue;
  late final double _indicatorWidth;
  final double _rightIndicatorEdge = 4.w;

  @override
  void initState() {
    super.initState();
    _setPercentage();
    _indicatorWidth = widget.width ?? 256.w;
    _setPositionWithPercentage();
  }

  void _setPercentage() {
    _progressValue = ((widget.actualSum / widget.sum) * 100);
  }

  void _setPositionWithPercentage() {
    _progressPosition = _indicatorWidth * (_progressValue / 100);
  }

  double _getCurrentPosition(double currentPosition) {
    if (currentPosition > _indicatorWidth - _rightIndicatorEdge) {
      return _indicatorWidth - _rightIndicatorEdge;
    }

    return currentPosition;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return ClipRRect(
      borderRadius: BorderRadiusFoundation.all40,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          ColoredBox(
            color: Colors.white,
            child: SizedBox(
              height: 32.h,
              width: _indicatorWidth,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedContainer(
                  height: 28.h,
                  width: _getCurrentPosition(_progressPosition),
                  curve: Curves.ease,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusFoundation.all40,
                    gradient: GradientFoundation.touchIdLinearGradient,
                    color: Colors.white,
                  ),
                  duration: const Duration(milliseconds: 300),
                ).paddingSymmetric(
                  horizontal: EdgeInsetsFoundation.all2,
                  vertical: EdgeInsetsFoundation.all2,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Text(
                S.current.DonationRaised(
                  widget.actualSum.toStringAsFixed(0),
                  widget.sum.toStringAsFixed(0),
                ),
                style: theme?.boldTextTheme.caption1Bold.copyWith(color: Colors.black),
              ),
            ),
          ),
          Positioned(
            right: 1.w,
            // top: 1.w,
            child: context.badgeButtonNoValue(
              data: BaseUiKitButtonData(
                onPressed: () => widget.onTap.call(),
                iconInfo: BaseUiKitButtonIconData(
                  iconData: CupertinoIcons.chevron_right_circle,
                  color: colorScheme?.surface,
                  size: 30.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
