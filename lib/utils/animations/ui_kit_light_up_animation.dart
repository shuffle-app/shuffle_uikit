import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLightUpAnimation extends StatefulWidget {
  final Widget child;
  final VoidCallback? onFinished;
  final VoidCallback? onStarted;

  const UiKitLightUpAnimation({
    Key? key,
    required this.child,
    this.onFinished,
    this.onStarted,
  }) : super(key: key);

  @override
  State<UiKitLightUpAnimation> createState() => _UiKitLightUpAnimationState();
}

class _UiKitLightUpAnimationState extends State<UiKitLightUpAnimation> with SingleTickerProviderStateMixin {
  final animDuration = const Duration(milliseconds: 50);
  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
    reverseDuration: const Duration(milliseconds: 1500),
    upperBound: 1,
    lowerBound: 0,
  );

  bool finishedFirstStage = false;
  bool finishedSecondStage = false;

  @override
  void initState() {
    super.initState();
    animationController.value = 1;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      animationController.addListener(_animationListener);
      _playBlinkAnimation();
      widget.onStarted?.call();
    });
  }

  double get reversedAnimationValue => 1 - animationController.value;

  void _animationListener() {
    if (animationController.isCompleted && !finishedSecondStage && finishedFirstStage) {
      setState(() => finishedSecondStage = true);
      widget.onFinished?.call();
      // animationController.forward(from: 0);
    }
    if (animationController.isCompleted && !finishedFirstStage) {
      setState(() => finishedFirstStage = true);
      // animationController.forward(from: 0);
    }
  }

  _playBlinkAnimation() async {
    await animationController.animateBack(0);
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        animationController.animateTo(0.25);
      },
    );
    await Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        animationController.animateBack(0);
      },
    );
    await Future.delayed(
      const Duration(milliseconds: 1000),
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
        return AnimatedContainer(
          curve: Curves.decelerate,
          duration: animDuration,
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
      child: widget.child,
    );
  }
}
