import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:shuffle_uikit/shuffle_uikit.dart';

class FingerprintButton extends StatefulWidget {
  const FingerprintButton({
    super.key,
    this.width,
    this.height,
    this.subtitle,
    this.onPressed,
    this.isCompleted,
    required this.title,
    required this.parentWidth,
    required this.animationPath,
    required this.onCompletedWidget,
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
  final VoidCallback? onCompleted;

  @override
  State<FingerprintButton> createState() => _FingerprintButtonState();
}

class _FingerprintButtonState extends State<FingerprintButton>
    with TickerProviderStateMixin {
  final ValueNotifier<Offset> _currentPosition =
      ValueNotifier<Offset>(Offset.zero);
  final Offset _startPosition = Offset.zero;
  late Offset _finishPosition;
  late Duration _animationDuration;

  late final AnimationController _controller;
  late final FlipCardController _flipController;

  late final double _buttonCenter;
  final Duration _initialDuration = const Duration(milliseconds: 100);

  bool _isOnPressedCallbackCalled = false;
  bool _isPressed = false;
  late bool _isCompleted;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _flipController = FlipCardController();
    _isCompleted = widget.isCompleted ?? false;

    _controller.addStatusListener((status) => _setAnimationListener(status));
    _controller.addStatusListener((_) => _setVibrationListener());
    _animationDuration = _initialDuration;
    _finishPosition = Offset(widget.parentWidth, 0);
    _buttonCenter = (widget.width ?? 105.w) / 2;
  }

  void _setVibrationListener() {
    Timer.periodic(_initialDuration, (timer) {
      if (_currentPosition.value.dx >= _finishPosition.dx / 1.3) {
        FeedbackIsolate.instance.addVibrationEvent(
          SystemHeavyVibrationIsolate(),
        );
      } else if (_currentPosition.value.dx >= _finishPosition.dx / 2) {
        FeedbackIsolate.instance.addVibrationEvent(
          SystemMediumVibrationIsolate(),
        );
      } else if (_currentPosition.value.dx >= _startPosition.dx) {
        FeedbackIsolate.instance.addVibrationEvent(
          SystemLightVibrationIsolate(),
        );
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
    } else if (status == AnimationStatus.dismissed) {
      setState(() {
        _isPressed = false;
      });
    }
  }

  _startAnimation() {
    _controller.forward();
  }

  void _reverseAnimation() {
    _controller.reverse().then((value) {
      final touchCenter = _finishPosition.dx / 2 + _buttonCenter;
      if (_currentPosition.value.dx < touchCenter) {
        setState(() {
          _animationDuration = const Duration(milliseconds: 800);
        });
        _currentPosition.value = _startPosition;
      }
    });
  }

  void _resetPosition() {
    final touchCenter = _finishPosition.dx / 2 + _buttonCenter;
    if (_currentPosition.value.dx >= touchCenter) {
      setState(() {
        _animationDuration = const Duration(milliseconds: 400);
        _isCompleted = true;
      });
      _flipController.toggleCard();
      _currentPosition.value = _finishPosition;
      widget.onCompleted?.call();
    } else {
      _reverseAnimation();
    }
  }

  void _setPosition(DragUpdateDetails details) {
    if (_isPressed && !_isCompleted) {
      _currentPosition.value = details.globalPosition;
    }
  }

  double _updatePosition(double distance) {
    final touchPosition = distance - _buttonCenter;
    if (distance <= _startPosition.dx || touchPosition <= _startPosition.dx) {
      return _startPosition.dx;
    }
    if (distance >= _finishPosition.dx || touchPosition >= _finishPosition.dx) {
      return _finishPosition.dx;
    }

    return touchPosition;
  }

  List<BoxShadow>? _getShadow(bool isPressed) {
    return isPressed
        ? [
            BoxShadow(
              color: ColorsFoundation.shadowPink.withOpacity(0.9),
              blurRadius: 20,
              spreadRadius: -10,
              offset: Offset.zero,
            )
          ]
        : [];
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _finishPosition = Offset(widget.parentWidth - (widget.width ?? 105.w), 0);
  }

  @override
  void dispose() {
    _controller.removeStatusListener((status) => _setAnimationListener(status));
    _controller.removeStatusListener((_) => _setVibrationListener());
    _controller.dispose();
    _flipController.controller?.dispose();
    _currentPosition.dispose();
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
        left: _updatePosition(currentPosition.dx),
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
              onPanUpdate: (details) => _setPosition(details),
              onPanEnd: (_) => _resetPosition(),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: _getShadow(_isPressed),
                ),
                child: UiKitCardWrapper(
                  width: widget.width ?? 105.w,
                  height: widget.height ?? height,
                  color: ColorsFoundation.surface3,
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
                              widget.animationPath != null
                                  ? widget.animationPath!
                                  : GraphicsFoundation.instance.animations
                                      .lottie.animationTouchId.path,
                              fit: BoxFit.cover,
                              controller: _controller,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ).paddingAll(EdgeInsetsFoundation.all4),
            back: Padding(
              padding: EdgeInsets.all(EdgeInsetsFoundation.all4),
              child: widget.onCompletedWidget,
            ),
          ),
        ),
      ),
    );
  }
}
