import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLightUpAnimation extends StatefulWidget {
  final Widget child;
  final VoidCallback? onFinished;
  final VoidCallback? onStarted;

  const UiKitLightUpAnimation({
    super.key,
    required this.child,
    this.onFinished,
    this.onStarted,
  });

  @override
  State<UiKitLightUpAnimation> createState() => _UiKitLightUpAnimationState();
}

class _UiKitLightUpAnimationState extends State<UiKitLightUpAnimation> with SingleTickerProviderStateMixin {
  final animDuration = const Duration(milliseconds: 250);
  final animControllerDuration = const Duration(milliseconds: 1000);
  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: animControllerDuration,
    reverseDuration: animControllerDuration,
    upperBound: 1,
    lowerBound: 0,
  );

  int phasesPassed = 0;

  @override
  void initState() {
    super.initState();
    animationController.value = 1;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        animationController.addListener(_animationListener);
        widget.onStarted?.call();
        _playBlinkAnimation();
      }
    });
  }

  double get reversedAnimationValue => 1 - animationController.value;

  void _animationListener() {
    if (animationController.isCompleted && mounted) {
      phasesPassed++;
      if (phasesPassed % 3 == 0) {
        widget.onFinished?.call();
        animationController.removeListener(_animationListener);
      }
    }
  }

  _playBlinkAnimation() async {
    await animationController.animateBack(0);
    if (!mounted) return;
    await Future.delayed(
      animControllerDuration,
          () => mounted ? animationController.animateTo(0.25) : null,
    );
    if (!mounted) return;
    await Future.delayed(
      animControllerDuration,
          () => mounted ? animationController.animateBack(0) : null,
    );
    if (!mounted) return;
    await Future.delayed(
      animControllerDuration,
          () => mounted ? animationController.animateTo(0.25) : null,
    );
    if (!mounted) return;
    await Future.delayed(
      animControllerDuration,
          () => mounted ? animationController.animateBack(0) : null,
    );
    if (!mounted) return;
    await Future.delayed(
      animControllerDuration,
          () => mounted ? animationController.forward(from: 0) : null,
    );
  }

  @override
  void dispose() {
    animationController.removeListener(_animationListener);
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ColorsFoundation.shadowPink.withOpacity(reversedAnimationValue),
                blurRadius: 18 * reversedAnimationValue,
              ),
            ],
          ),
          child: child!,
        );
      },
      child: GestureDetector(
        child: widget.child,
      ),
    );
  }
}
