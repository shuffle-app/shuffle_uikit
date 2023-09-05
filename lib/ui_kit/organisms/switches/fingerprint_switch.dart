import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/content_wrappers/ui_kit_border_wrapper.dart';

class FingerprintSwitch extends StatefulWidget {
  const FingerprintSwitch({
    super.key,
    required this.title,
    required this.backgroundImage,
    required this.onCompletedWidget,
    required this.isHealthKitEnabled,
    this.subtitle,
    this.isCompleted,
    this.animationPath,
    this.onPressed,
    this.onCompleted,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget onCompletedWidget;
  final bool? isCompleted;
  final ImageWidget backgroundImage;
  final bool isHealthKitEnabled;
  final String? animationPath;
  final VoidCallback? onPressed;
  final VoidCallback? onCompleted;

  @override
  State<FingerprintSwitch> createState() => _FingerprintSwitchState();
}

class _FingerprintSwitchState extends State<FingerprintSwitch> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  double _currentWidth = 0.0;
  late ValueNotifier<bool> _isCompleted;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getCurrentWidth());
    _controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
    _isCompleted = ValueNotifier<bool>(widget.isCompleted ?? false);
  }

  void _startAnimation() {
    _controller.forward();
  }

  void _getCurrentWidth() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    setState(() => _currentWidth = renderBox.size.width);
  }

  @override
  void didUpdateWidget(covariant FingerprintSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isHealthKitEnabled && oldWidget.isHealthKitEnabled) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = 0.27.sw * 1.68;

    return Stack(
      children: [
        UiKitBorderWrapper(
          height: height,
          child: ClipRRect(
            borderRadius: BorderRadiusFoundation.all28,
            child: Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()..scale(1.0, 0.8),
              child: widget.backgroundImage,
            ),
          ),
        ),
        FingerprintButton(
          animationPath: widget.animationPath,
          title: widget.title,
          subtitle: widget.subtitle,
          parentWidth: _currentWidth,
          onPressed: widget.onPressed,
          onCompleted: () {
            _isCompleted.value = true;
            widget.onCompleted?.call();
          },
          isCompleted: _isCompleted.value,
          onCompletedWidget: widget.onCompletedWidget,
        ),
        ValueListenableBuilder(
          valueListenable: _isCompleted,
          builder: (_, isCompleted, __) => Positioned(
            left: 50.w,
            top: 65.w,
            child: AnimatedOpacity(
              opacity: isCompleted ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: GradientableWidget(
                gradient: GradientFoundation.touchIdLinearGradient,
                child: Text(
                  'Tap it',
                  style: context.uiKitTheme?.boldTextTheme.subHeadline,
                ),
              ),
            ),
          ),
        ),
        if (!widget.isHealthKitEnabled)
          SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: _animation,
            child: UiKitCardWrapper(
              height: height,
              color: ColorsFoundation.surface3,
              borderRadius: BorderRadiusFoundation.all28,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      highlightColor: ColorsFoundation.transparent,
                      splashColor: ColorsFoundation.transparent,
                      hoverColor: ColorsFoundation.transparent,
                    ),
                    child: IconButton(
                      onPressed: () => _startAnimation(),
                      icon: const Icon(
                        Icons.close,
                        color: ColorsFoundation.warning,
                        size: 20,
                      ),
                    ),
                  ).paddingOnly(
                    top: EdgeInsetsFoundation.vertical12,
                    right: EdgeInsetsFoundation.horizontal12,
                  ),
                  Text(
                    'No health kit available on your device, so the result will be random',
                    style: context.uiKitTheme?.regularTextTheme.body.copyWith(
                      color: ColorsFoundation.warning,
                    ),
                  ).paddingSymmetric(
                    horizontal: EdgeInsetsFoundation.horizontal20,
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
