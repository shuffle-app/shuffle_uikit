import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitAnimatedPullToShowRow extends StatefulWidget {
  final ValueNotifier<double> progressNotifier;
  final List<Widget> children;
  final String noChildrenText;

  const UiKitAnimatedPullToShowRow({
    Key? key,
    required this.progressNotifier,
    required this.children,
    required this.noChildrenText,
  }) : super(key: key);

  @override
  State<UiKitAnimatedPullToShowRow> createState() => _UiKitAnimatedPullToShowRowState();
}

class _UiKitAnimatedPullToShowRowState extends State<UiKitAnimatedPullToShowRow> {
  bool _isHintVisible = false;
  final double _hintVisibleThreshold = 0.5;
  late Timer _debouncer = Timer(_timerDuration, () {});

  Duration get _timerDuration => const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) {
      widget.progressNotifier.addListener(_pullListener);
    });
  }

  void _pullListener() {
    print('Got new value for progressNotifier: ${widget.progressNotifier.value}');
    if (widget.progressNotifier.value < 1) {
      setState(() => _isHintVisible = true);
    } else if (widget.progressNotifier.value >= 1) {
      setState(() => _isHintVisible = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return AnimatedBuilder(
      animation: widget.progressNotifier,
      builder: (context, child) {
        return UiKitCardWrapper(
          color: colorScheme?.surface2,
          borderRadius: BorderRadiusFoundation.zero,
          height: (0.15.sw + (SpacingFoundation.verticalSpacing16 * 2)) * widget.progressNotifier.value,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 20),
            opacity: _isHintVisible ? 1 : min(widget.progressNotifier.value, 1),
            child: _isHintVisible
                ? Center(child: AnimatedPullToShowHint(progressNotifier: widget.progressNotifier))
                : child,
          ),
        );
      },
      child: widget.children.isEmpty
          ? GradientableWidget(
              gradient: GradientFoundation.defaultLinearGradient,
              child: Text(
                widget.noChildrenText,
                style: boldTextTheme?.caption1Medium.copyWith(color: Colors.white),
              ),
            )
          : ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
              itemBuilder: (context, index) => widget.children.elementAt(index),
              separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
              itemCount: widget.children.length,
            ),
    );
  }
}

class AnimatedPullToShowHint extends StatefulWidget {
  final ValueNotifier<double> progressNotifier;

  const AnimatedPullToShowHint({
    Key? key,
    required this.progressNotifier,
  }) : super(key: key);

  @override
  State<AnimatedPullToShowHint> createState() => _AnimatedPullToShowHintState();
}

class _AnimatedPullToShowHintState extends State<AnimatedPullToShowHint> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      value: 0,
    )..addListener(_animationListener);
    _controller.forward();
  }

  void _animationListener() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_animationListener);
    _controller.dispose();
    super.dispose();
  }

  Size get ballSize => Size(0.15625.sw, 0.15625.sw);

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;

    return UiKitCardWrapper(
      borderRadius: BorderRadiusFoundation.max,
      gradient: GradientFoundation.defaultLinearGradient,
      height: ballSize.height,
      width: ballSize.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, (ballSize.height / 12) * sin(1 - _controller.value)),
                child: child,
              );
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ImageWidget(
                height: ballSize.height / 2,
                width: ballSize.width * 0.75,
                svgAsset: GraphicsFoundation.instance.svg.chevronDown,
                fit: BoxFit.cover,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
