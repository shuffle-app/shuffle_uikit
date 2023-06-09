import 'package:flutter/material.dart';

class TriggeringWidget extends StatefulWidget {
  const TriggeringWidget({
    Key? key,
    required this.child,
    this.startDelay,
    this.animDuration = const Duration(milliseconds: 1600),
    this.startOffset = const Offset(0,0),
    this.endOffset = const Offset(0,10),
    this.applyReverseOnEnd = true,
  }) : super(key: key);

  final Widget child;
  final Duration? startDelay;
  final Duration animDuration;
  final Offset startOffset;
  final Offset endOffset;
  final bool applyReverseOnEnd;

  @override
  State<TriggeringWidget> createState() => _TriggeringWidgetState();
}

class _TriggeringWidgetState extends State<TriggeringWidget>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    duration: widget.animDuration,
    vsync: this,
  );
  late final curvedAnimation =
  CurvedAnimation(parent: controller, curve: Curves.easeIn);

  late final offset =
  Tween<Offset>(begin: widget.startOffset, end: widget.endOffset)
      .animate(curvedAnimation);

  @override
  void initState() {
    super.initState();
    () async {
      await Future.delayed(widget.startDelay ?? Duration.zero);
      controller
        ..forward()
        ..addStatusListener(listenAnim);
    }();
  }

  //ignore: unused parameter
  void listenAnim(AnimationStatus status) {
    if (status == AnimationStatus.completed && widget.applyReverseOnEnd) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      Future.delayed(const Duration(seconds: 10))
          .then((value) => controller.forward());
    }
  }

  @override
  void dispose() {
    controller.removeStatusListener(listenAnim);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Transform.translate(
          offset: offset.value,
          child: widget.child,
        );
      },
      animation: controller,
    );
  }
}
