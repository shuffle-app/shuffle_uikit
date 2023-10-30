import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class FingerprintButton extends StatefulWidget {
  const FingerprintButton({
    super.key,
    required this.title,
    required this.parentWidth,
    required this.animationPath,
    required this.onCompletedWidget,
    this.width,
    this.height,
    this.subtitle,
    this.onPressed,
    this.isCompleted,
    this.onCompleted,
  });

  final Widget title;
  final double parentWidth;
  final double? width;
  final double? height;
  final String? animationPath;
  final Widget? subtitle;
  final Widget onCompletedWidget;
  final bool? isCompleted;
  final VoidCallback? onPressed;
  final AsyncCallback? onCompleted;

  @override
  State<FingerprintButton> createState() => _FingerprintButtonState();
}

class _FingerprintButtonState extends State<FingerprintButton> with TickerProviderStateMixin {
  late final ValueNotifier<Offset> _currentPosition;

  final Offset _startPosition = Offset.zero;
  late Offset _finishPosition;
  late Duration _animationDuration;
  late AnimationController _shadowController;
  late Animation<double> _shadowAnimation;

  late final AnimationController _controller;
  late final FlipCardController _flipController;

  late final double _buttonCenter;
  final Duration _initialDuration = Duration.zero;
  final Duration _vibrationDuration = const Duration(milliseconds: 50);

  bool _isOnPressedCallbackCalled = false;
  bool _isPressed = false;
  bool _onPanDisabled = false;
  late bool _isCompleted;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _shadowController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _flipController = FlipCardController();
    _isCompleted = widget.isCompleted ?? false;
    _animationDuration = _initialDuration;
    _finishPosition = Offset(widget.parentWidth, 0);
    _currentPosition = ValueNotifier<Offset>(Offset.zero);
    _buttonCenter = (widget.width ?? 105.w) / 2;
    _shadowAnimation = Tween(begin: 0.0, end: 1.0).animate(_shadowController);

    _controller.addStatusListener((status) => _setAnimationListener(status));
    _controller.addStatusListener((_) => _setVibrationListener());

    if (_isCompleted) {
      Future.delayed(Duration.zero, () {
        _flipController.toggleCard();
      });
    }
  }

  void _setVibrationListener() {
    Timer.periodic(_vibrationDuration, (timer) {
      if (_currentPosition.value.dx >= _finishPosition.dx / 1.2) {
        FeedbackIsolate.instance.addEvent(FeedbackIsolateHaptics(
          intensities: [170, 200],
          pattern: [10, 5],
        ));
      } else if (_currentPosition.value.dx >= _finishPosition.dx / 2.2) {
        FeedbackIsolate.instance.addEvent(FeedbackIsolateHaptics(
          intensities: [130, 170],
          pattern: [10, 5],
        ));
      } else if (_currentPosition.value.dx >= _startPosition.dx) {
        FeedbackIsolate.instance.addEvent(FeedbackIsolateHaptics(
          intensities: [100, 130],
          pattern: [10, 5],
        ));
      }
      if ((!_isPressed && _controller.isDismissed) || _isCompleted) {
        timer.cancel();
      }
    });
  }

  void _setAnimationListener(status) {
    if (status == AnimationStatus.completed) {
      if (!_isOnPressedCallbackCalled) {
        widget.onPressed?.call();
      }
      setState(() {
        _isPressed = true;
        _animationDuration = _initialDuration;
        _isOnPressedCallbackCalled = true;
      });
      _shadowController.forward();
    } else if (status == AnimationStatus.dismissed) {
      setState(() => _isPressed = false);
      _shadowController.reverse();
    }
  }

  _startAnimation() {
    _controller.forward();
  }

  void _reverseAnimation() {
    _controller.reverse().then((value) {
      final touchCenter = _finishPosition.dx / 1.6 + _buttonCenter;
      if (_currentPosition.value.dx < touchCenter) {
        setState(() => _animationDuration = const Duration(milliseconds: 800));
        _currentPosition.value = _startPosition;
      }
    });
  }

  void _resetPosition() {
    if (!_isCompleted) {
      final touchCenter = _finishPosition.dx / 1.6 + _buttonCenter;
      if (_currentPosition.value.dx >= touchCenter) {
        setState(() {
          _animationDuration = const Duration(milliseconds: 400);
          _isCompleted = true;
          _onPanDisabled = true;
        });

        _currentPosition.value = Offset(
          _finishPosition.dx + _buttonCenter,
          _finishPosition.dy,
        );
        widget.onCompleted?.call().then((_) => _flipController.toggleCard());
      } else {
        _reverseAnimation();
      }
    }
  }

  void _setPosition<T>(T details) {
    if (_isPressed && !_isCompleted) {
      switch (details) {
        case DragUpdateDetails():
          _currentPosition.value = details.globalPosition;
        case DragStartDetails():
          _currentPosition.value = details.globalPosition;
      }
    }
  }

  double _updatePosition(double distance) {
    final touchPosition = distance - _buttonCenter;
    if (distance <= _startPosition.dx || touchPosition <= _startPosition.dx) {
      return _startPosition.dx;
    }
    if (touchPosition >= _finishPosition.dx) {
      return _finishPosition.dx;
    }
    if (touchPosition >= _finishPosition.dx / 1.3) {
      _onPanDisabled = true;
    }

    return touchPosition;
  }

  @override
  void didUpdateWidget(covariant FingerprintButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() => _finishPosition = Offset(widget.parentWidth - (widget.width ?? 105.w), 0));
    if (widget.isCompleted != null && widget.isCompleted != oldWidget.isCompleted) {
      setState(() => _isCompleted = widget.isCompleted!);
      if (_isCompleted && (_flipController.state?.isFront ?? false)) {
        _flipController.toggleCard();
      }
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener((status) => _setAnimationListener(status));
    _controller.removeStatusListener((_) => _setVibrationListener());
    _controller.dispose();
    _flipController.controller?.dispose();
    _currentPosition.dispose();
    _shadowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = 0.27.sw * 1.68;

    return ValueListenableBuilder(
      valueListenable: _currentPosition,
      builder: (_, currentPosition, __) => AnimatedPositioned(
        curve: _isCompleted ? Curves.easeIn : Curves.bounceOut,
        duration: _animationDuration,
        left: (widget.isCompleted ?? false) ? null : _updatePosition(currentPosition.dx),
        right: (widget.isCompleted ?? false) ? 0 : null,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: widget.height ?? height,
            maxHeight: widget.height ?? height,
            maxWidth: widget.width ?? 105.w,
          ),
          child: FlipCard(
            controller: _flipController,
            fill: Fill.fillBack,
            flipOnTouch: false,
            direction: FlipDirection.HORIZONTAL,
            side: CardSide.FRONT,
            front: GestureDetector(
              onTapDown: (_) => _startAnimation(),
              onTapUp: (_) => _reverseAnimation(),
              onPanUpdate: (details) => _onPanDisabled ? _resetPosition() : _setPosition(details),
              onPanStart: (details) => _onPanDisabled ? null : _setPosition(details),
              onPanEnd: (_) => _onPanDisabled ? null : _resetPosition(),
              child: AnimatedBuilder(
                  animation: _shadowAnimation,
                  builder: (context, _) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: ColorsFoundation.shadowPink.withOpacity(_shadowAnimation.value),
                            blurRadius: 20,
                            spreadRadius: -3,
                            offset: Offset.zero,
                          ),
                        ],
                      ),
                      child: UiKitCardWrapper(
                        width: widget.width ?? 105.w,
                        height: widget.height ?? height,
                        color: context.uiKitTheme?.colorScheme.surface3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GradientableWidget(
                              gradient: GradientFoundation.touchIdLinearGradient,
                              child: widget.title,
                            ),
                            SpacingFoundation.verticalSpace12,
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                              child: SizedBox(
                                height: 48.w,
                                width: 48.w,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: LottieBuilder.asset(
                                    package: 'shuffle_uikit',
                                    controller: _controller,
                                    fit: BoxFit.cover,
                                    widget.animationPath != null
                                        ? widget.animationPath!
                                        : GraphicsFoundation.instance.animations.lottie.animationTouchId.path,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ).paddingAll(EdgeInsetsFoundation.all4),
            back: widget.onCompletedWidget.paddingAll(EdgeInsetsFoundation.all4),
          ),
        ),
      ),
    );
  }
}
