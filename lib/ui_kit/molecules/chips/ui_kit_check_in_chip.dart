import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCheckInChip extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isChecked;

  const UiKitCheckInChip({super.key, required this.onPressed, required this.isChecked});

  @override
  State<UiKitCheckInChip> createState() => _UiKitCheckInChipState();
}

class _UiKitCheckInChipState extends State<UiKitCheckInChip> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    if (!widget.isChecked) {
      _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
      _controller.addStatusListener(_controllerStatusListener);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) => _pageController.jumpToPage(2));
    }
  }

  _controllerStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _pageController.animateToPage(0, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    }
  }

  @override
  void didUpdateWidget(covariant UiKitCheckInChip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isChecked != oldWidget.isChecked) {
      if (widget.isChecked) {
        _pageController.jumpToPage(2);
        _controller.stop();
        // } else {
        //   _pageController.animateToPage(0, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
      }
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_controllerStatusListener);
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  onCheckIn() {
    if (!widget.isChecked) {
      widget.onPressed.call();
      _controller.forward(from: 0);
      setState(() {
        _pageController.animateToPage(1, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(color: Colors.white);

    return AnimatedContainer(
        height: 26.h,
        width: widget.isChecked ? 26.h : 0.3.sw,
        duration: const Duration(milliseconds: 100),
        child: context.smallOutlinedButton(
            blurred: true,
            borderRadius: BorderRadiusFoundation.all24,
            gradient: GradientFoundation.attentionCard,
            data: BaseUiKitButtonData(
                backgroundColor: Colors.white.withOpacity(0.3),
                onPressed: onCheckIn,
                iconWidget: PageView(
                  controller: _pageController,
                  children: [
                    Center(
                        child: GradientableWidget(
                            gradient: GradientFoundation.attentionCard,
                            child: Text(
                              S.of(context).CheckIn.toUpperCase(),
                              style: textStyle,
                            ))),
                    const GradientableWidget(
                        gradient: GradientFoundation.attentionCard,
                        child: CupertinoActivityIndicator(
                          color: CupertinoColors.white,
                        )),
                    Transform.translate(
                        offset: const Offset(-1, -1),
                        child: const GradientableWidget(
                            gradient: GradientFoundation.attentionCard,
                            child: ImageWidget(
                              iconData: ShuffleUiKitIcons.check,
                              color: Colors.white,
                            ))),
                  ],
                ))));
  }
}
