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
      animationController.addListener(_animationListener);
      widget.onStarted?.call();
      _playBlinkAnimation();
    });
  }

  double get reversedAnimationValue => 1 - animationController.value;

  void _animationListener() {
    if (animationController.isCompleted) {
      phasesPassed++;
      if (phasesPassed % 3 == 0) {
        widget.onFinished?.call();
        animationController.removeListener(_animationListener);
      }
    }
  }

  _playBlinkAnimation() async {
    await animationController.animateBack(0);
    await Future.delayed(
      animControllerDuration,
      () => animationController.animateTo(0.25),
    );
    await Future.delayed(
      animControllerDuration,
      () => animationController.animateBack(0),
    );
    await Future.delayed(
      animControllerDuration,
      () => animationController.animateTo(0.25),
    );
    await Future.delayed(
      animControllerDuration,
      () => animationController.animateBack(0),
    );
    await Future.delayed(
      animControllerDuration,
      () => animationController.forward(from: 0),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return DecoratedBox(
          // curve: Curves.decelerate,
          // duration: animDuration,
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
