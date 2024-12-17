import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

//this is a widget that animates the reaction emoji based on the provided reaction string

class ReactionAnimation extends StatefulWidget {
  final SvgGenImage reaction;
  final VoidCallback? onAnimationEnd;
  final Duration duration;

  const ReactionAnimation(
      {super.key, required this.reaction, this.onAnimationEnd, this.duration = const Duration(milliseconds: 500)});

  @override
  State<ReactionAnimation> createState() => _ReactionAnimationState();
}

class _ReactionAnimationState extends State<ReactionAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final numberOfReactions = 1;

  // Define the final offsets for each widget
  final List<Offset> finalOffsets = const [
    // Offset(-15.0, 0), // Top-left
    // Offset(-8, -5), // Bottom-left
    Offset(0.0, -15), // Top-center
    // Offset(8, -5), // Bottom-right
    // Offset(15, 0), // Top-right
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration,upperBound: 2.6);
    _controller.addStatusListener(_animationStatusChanged);
    _controller.forward();
  }

  void _animationStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed && widget.onAnimationEnd != null) {
      widget.onAnimationEnd!();
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_animationStatusChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) => Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                for (int index = 0; index < numberOfReactions; index++)
                  Transform(
                      transform: Matrix4.identity()
                        ..translate(
                          finalOffsets[index].dx * _controller.value + 0.0,
                          finalOffsets[index].dy * _controller.value,
                        ),
                      child: Transform.scale(
                        scale: _controller.value + 1,
                        child: ImageWidget(svgAsset: widget.reaction,width: 15.w,
                          height: 15.w,
                          fit: BoxFit.contain,),
                      ))
              ],
            ));
  }
}
