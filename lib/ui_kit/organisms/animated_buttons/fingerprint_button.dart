import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class FingerprintButton extends StatefulWidget {
  const FingerprintButton({
    super.key,
    required this.animationPath,
    required this.title,
    this.height,
    this.width,
    this.onPressed,
  });

  final String animationPath;
  final Widget title;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  @override
  State<FingerprintButton> createState() => _FingerprintButtonState();
}

class _FingerprintButtonState extends State<FingerprintButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isPressed = false;

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
              offset: Offset.zero,
            )
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
    final height = 0.27.sw * 1.68;
    final width = 105.w;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.height ?? height,
        maxWidth: widget.width ?? width,
      ),
      child: GestureDetector(
        onTapDown: (_) => _startAnimation(),
        onTapUp: (_) => _reverseAnimation(),
        onPanEnd: (_) => _reverseAnimation(),
        child: AnimatedContainer(
          duration: const Duration(seconds: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.all28,
            boxShadow: _getShadow(_isPressed),
          ),
          child: UiKitCardWrapper(
            width: widget.width ?? width,
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
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: SizedBox(
                    height: 48.w,
                    width: 48.w,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: LottieBuilder.asset(
                        package: 'shuffle_uikit',
                        widget.animationPath,
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
      ),
    );
  }
}
