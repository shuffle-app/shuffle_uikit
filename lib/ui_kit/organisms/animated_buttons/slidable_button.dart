import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SlidableButton extends StatefulWidget {
  final bool isCompleted;
  final Widget slidableChild;
  final Widget onCompletedChild;
  final String hintText;

  const SlidableButton(
      {super.key,
      this.isCompleted = false,
      this.hintText = 'Swipe to start',
      required this.slidableChild,
      required this.onCompletedChild});

  @override
  State<SlidableButton> createState() => _SlidableButtonState();
}

class _SlidableButtonState extends State<SlidableButton> with TickerProviderStateMixin {
  late final ValueNotifier<Offset> _currentPosition;

  late bool _isCompleted;
  late Duration _animationDuration;
  final Offset _startPosition = Offset.zero;

  @override
  void initState() {
    _isCompleted = widget.isCompleted;
    _currentPosition = ValueNotifier(_startPosition);
    _animationDuration = const Duration(milliseconds: 80);
    super.initState();
  }

  double _updatePosition(double distance) {
    if (distance >= 0.7.sw) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
      setState(() {
        _isCompleted = true;
      }));
      return 0.7.sw;
    }

    return distance;
  }

  _resetPosition() {
    _currentPosition.value = _startPosition;
  }

  void _setPosition<T>(T details) {
    if (!_isCompleted) {
      switch (details) {
        case DragUpdateDetails():
          _currentPosition.value = details.globalPosition;
        case DragStartDetails():
          _currentPosition.value = details.globalPosition;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return DecoratedBox(
        decoration: BoxDecoration(border: GradientFoundation.gradientBorder, borderRadius: BorderRadiusFoundation.max),
        child: SizedBox(
            height: 41.h,
            child: Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.centerLeft,
              children: [
                if (!_isCompleted)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ArrowsAnimation(),
                      Text(
                        widget.hintText,
                        style: theme?.regularTextTheme.caption1.copyWith(color: theme.colorScheme.darkNeutral400),
                      ),
                      const ArrowsAnimation()
                    ],
                  ),
                if (_isCompleted)
                  Positioned(
                    right: 0,
                    left: 0,
                    child: widget.onCompletedChild,
                  )
                else
                  ValueListenableBuilder(
                      valueListenable: _currentPosition,
                      builder: (_, currentPosition, __) => AnimatedPositioned(
                            curve: _isCompleted ? Curves.easeIn : Curves.bounceOut,
                            duration: _animationDuration,
                            left: (_isCompleted) ? null : _updatePosition(currentPosition.dx),
                            right: (_isCompleted) ? 0 : null,
                            child: GestureDetector(
                                onPanUpdate: (details) => _isCompleted ? _resetPosition() : _setPosition(details),
                                onPanStart: (details) => _setPosition(details),
                                onPanEnd: (_) => _isCompleted ? null : _resetPosition(),
                                child: AbsorbPointer(child: widget.slidableChild)),
                          )),
              ],
            ).paddingSymmetric(horizontal: 4.w)));
  }
}
