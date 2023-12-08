import 'package:flutter/material.dart';

export 'arrows_animations.dart';
export 'back_anim_stack.dart';
export 'rotatable_widget.dart';
export 'triggering_widget.dart';
export 'ui_kit_shimmer_progress_indicator.dart';
export 'wave_splash.dart';

class Animations {
  static slideAnimation(
    Animation<double> animation,
    _,
    Widget child,
  ) =>
      SlideTransition(
        position: Tween<Offset>(
          end: Offset.zero,
          begin: const Offset(0.0, 1.0),
        ).animate(animation),
        child: child,
      );

  static Tween<T> createImplicitTween<T>(T val) {
    return Tween<T>(begin: val, end: val);
  }
}

class ImpScaleAnim extends StatelessWidget {
  const ImpScaleAnim({
    Key? key,
    required this.child,
    required this.scale,
  }) : super(key: key);

  final Widget child;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 600),
      scale: scale,
      curve: Curves.easeInOutBack,
      child: child,
    );
  }
}
