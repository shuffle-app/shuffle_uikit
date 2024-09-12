import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitAnimatedPullToShowRow extends StatefulWidget {
  final AnimationController progressNotifier;
  // final ValueNotifier<AnimatedPullToShowState> stateNotifier;
  final List<Widget> children;
  final String noChildrenText;

  const UiKitAnimatedPullToShowRow({
    Key? key,
    required this.progressNotifier,
    required this.children,
    required this.noChildrenText,
    // required this.stateNotifier,
  }) : super(key: key);

  @override
  State<UiKitAnimatedPullToShowRow> createState() => _UiKitAnimatedPullToShowRowState();
}

class _UiKitAnimatedPullToShowRowState extends State<UiKitAnimatedPullToShowRow> {
  bool _isHintVisible = true;
  final double _hintVisibleThreshold = 0.5;
  bool _showSecondHint = false;
  late Timer _debouncer = Timer(_timerDuration, () {});

  final _subscribedUsersFirstPhaseThreshold = 0.3;

  final _subscribedUsersSecondPhaseThreshold = 1.4;

  final _subscribedUsersThirdPhaseThreshold = 1.7;

  Duration get _timerDuration => const Duration(milliseconds: 500);

  _runDebouncerCallback(VoidCallback callback) {
    _debouncer.cancel();
    _debouncer = Timer(_timerDuration, callback);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) {
      widget.progressNotifier.addListener(_pullListener);
    });
  }

  void _pullListener() {
    if (widget.progressNotifier.value < _subscribedUsersFirstPhaseThreshold) {
      if (!_isHintVisible) setState(() => _isHintVisible = true);
    } else if (widget.progressNotifier.value >= _subscribedUsersFirstPhaseThreshold) {
      if (_isHintVisible) setState(() => _isHintVisible = false);
      _runDebouncerCallback(() => setState(() => _showSecondHint = true));
    } else if (widget.progressNotifier.value >= _subscribedUsersThirdPhaseThreshold) {
      setState(() => _showSecondHint = true);
    }
  }

  @override
  void dispose() {
    print('calling dispose on UiKitAnimatedPullToShowRow');
    widget.progressNotifier.removeListener(_pullListener);
    super.dispose();
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
          height: (0.15.sw + (SpacingFoundation.verticalSpacing16 * 2)) *
              (_isHintVisible
                  ? widget.progressNotifier.value
                  : _showSecondHint
                      ? widget.progressNotifier.value
                      : min(1, widget.progressNotifier.value)),
          child: Stack(
            children: [
              if (_showSecondHint || _isHintVisible)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 20),
                  bottom: 0,
                  left: (1.sw / 2) - (0.15625.sw / 2),
                  child: const AnimatedPullToShowHint(),
                ),
              if (!_isHintVisible)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 20),
                  top: _showSecondHint ? 0.125.sw / 2 : 0,
                  height: 0.125.sw + (EdgeInsetsFoundation.all16 * 2),
                  child: child!,
                ),
            ],
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
  const AnimatedPullToShowHint({
    Key? key,
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
    return UiKitCardWrapper(
      borderRadius: BorderRadiusFoundation.max,
      gradient: GradientFoundation.defaultLinearGradient,
      height: ballSize.height,
      width: ballSize.width,
      child: AnimatedBuilder(
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
    );
  }
}

enum AnimatedPullToShowState { showFirstHint, showSecondHint, showLastPhase }
