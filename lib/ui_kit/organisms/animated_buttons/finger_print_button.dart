import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class FingerPrintButton extends StatefulWidget {
  const FingerPrintButton({
    super.key,
    required this.height,
    required this.path,
    required this.title,
    this.width,
    this.onPressed,
  });

  final String path;
  final Widget title;
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  @override
  State<FingerPrintButton> createState() => _FingerPrintButtonState();
}

class _FingerPrintButtonState extends State<FingerPrintButton>
    with TickerProviderStateMixin {
  bool _isPressed = false;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _setAnimationListener();
  }

  void _setAnimationListener() {
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isPressed = true;
          widget.onPressed;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _isPressed = false;
        });
      }
    });
  }

  void _startAnimation() {
    _controller.forward();
  }

  void _reverseAnimation() {
    _controller.reverse();
  }

  List<BoxShadow>? _getShadow(bool isPressed) {
    return isPressed
        ? const [
            BoxShadow(
                color: ColorsFoundation.shadowPink,
                blurRadius: 10,
                spreadRadius: -5,
                offset: Offset.zero)
          ]
        : [];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _startAnimation(),
      onTapUp: (_) => _reverseAnimation(),
      child: AnimatedContainer(
        duration: const Duration(seconds: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusFoundation.all28,
          boxShadow: _getShadow(_isPressed),
        ),
        child: UiKitCardWrapper(
          width: widget.width ?? 106.w,
          height: widget.height,
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
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: SizedBox(
                  height: 48.w,
                  width: 48.w,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: LottieBuilder.asset(
                      widget.path,
                      fit: BoxFit.cover,
                      controller: _controller,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ).paddingAll(EdgeInsetsFoundation.all4),
      ),
    );
  }
}
