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
        Future.delayed(const Duration(milliseconds: 180), () => controller.forward(from: 0.0));
        break;
      default:
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
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.itemCount, (index) {
              return Opacity(
                opacity: 1 - ((1 / widget.itemCount) * index - controller.value).abs(),
                child: GradientableWidget(
                    gradient: GradientFoundation.badgeIcon,
                    child: SizedBox(
                        width: 10.w,
                        child:
                            ImageWidget(svgAsset: GraphicsFoundation.instance.svg.chevronRight, color: Colors.white))),
              );
            })));
  }
}
