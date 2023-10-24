import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ArrowsAnimation extends StatefulWidget {
  final int itemCount;
  final Duration duration;

  const ArrowsAnimation({super.key, this.itemCount = 3, this.duration = const Duration(seconds: 2)});

  @override
  State<ArrowsAnimation> createState() => _ArrowsAnimationState();
}

class _ArrowsAnimationState extends State<ArrowsAnimation> with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );

  @override
  void initState() {
    controller.forward();
    controller.addListener(_loopAnimation);
    super.initState();
  }

  _loopAnimation() {
    switch (controller.status) {
      case AnimationStatus.completed:
        controller.forward(from: 0.0);
        break;
      case AnimationStatus.dismissed:
        // controller.forward();
        break;
      case AnimationStatus.forward:
        // controller.reverse();
        break;
      case AnimationStatus.reverse:
        // controller.forward();
        break;
    }
  }

  @override
  void dispose() {
    controller.removeListener(_loopAnimation);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.itemCount, (index) {
          return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Opacity(
                opacity: 1 - ((1 / widget.itemCount) * index - controller.value).abs(),
                child: child,
              );
            },
            child: GradientableWidget(
                gradient: GradientFoundation.badgeIcon,
                child: ImageWidget(svgAsset: GraphicsFoundation.instance.svg.chevronRight, color: Colors.white)),
          );
        }));
  }
}
