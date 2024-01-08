import 'package:flutter/foundation.dart';
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
    this.height,
    this.subtitle,
    this.isCompleted,
    this.animationPath,
    this.onPressed,
    this.onCompleted,
  });

  final double? height;
  final Widget title;
  final Widget? subtitle;
  final Widget onCompletedWidget;
  final bool? isCompleted;
  final ImageWidget backgroundImage;
  final bool isHealthKitEnabled;
  final String? animationPath;
  final VoidCallback? onPressed;
  final AsyncCallback? onCompleted;

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
    if (widget.isCompleted != null) {
      _isCompleted.value = widget.isCompleted!;
    }
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
    final height = widget.height ?? 0.95.sw * 0.51;
    final isLightTheme = context.uiKitTheme?.themeMode == ThemeMode.light;

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
        Opacity(
          opacity: 0.06,
          child: Container(
            height: height,
            width: 1.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusFoundation.all28,
              gradient: isLightTheme ? GradientFoundation.diamondGradient : null,
            ),
          ),
        ),
        FingerprintButton(
          height: height,
          animationPath: widget.animationPath,
          title: widget.title,
          subtitle: widget.subtitle,
          parentWidth: _currentWidth,
          onPressed: widget.onPressed,
          onCompleted: () async => await widget.onCompleted?.call().then((_) => _isCompleted.value = true),
          isCompleted: _isCompleted.value,
          onCompletedWidget: widget.onCompletedWidget,
        ),
        ValueListenableBuilder(
          valueListenable: _isCompleted,
          builder: (_, isCompleted, __) => Positioned(
            top: (height / 2) - 10,
            left: 70.w,
            child: AnimatedOpacity(
              opacity: isCompleted ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: isCompleted
                  ? GradientableWidget(
                      gradient: GradientFoundation.touchIdLinearGradient,
                      child: Text(
                        S.of(context).TapIt,
                        style: context.uiKitTheme?.boldTextTheme.subHeadline.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
        if (!widget.isHealthKitEnabled && !_isCompleted.value)
          SizeTransition(
            sizeFactor: _animation,
            child: UiKitCardWrapper(
              height: height + 0.1.h,
              width: _currentWidth + 0.1.w,
              color: context.uiKitTheme?.colorScheme.surface3,
              borderRadius: BorderRadiusFoundation.all28,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => _startAnimation(),
                    icon: Icon(Icons.close, color: ColorsFoundation.warning, size: 18.w),
                  ).paddingOnly(
                    top: EdgeInsetsFoundation.vertical12,
                    right: EdgeInsetsFoundation.horizontal12,
                  ),
                  SpacingFoundation.verticalSpace4,
                  Text(
                    S.of(context).NoHealthKitAvailableOnYourDevice,
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
