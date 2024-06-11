import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PropertiesTypeAnimatedButton extends StatefulWidget {
  const PropertiesTypeAnimatedButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  State<PropertiesTypeAnimatedButton> createState() =>
      _PropertiesTypeAnimatedButtonState();
}

class _PropertiesTypeAnimatedButtonState
    extends State<PropertiesTypeAnimatedButton> with TickerProviderStateMixin {
  bool isTapped = false;
  late final AnimationController _controller;
  late final Animation<double> _angelAnimation;
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(
        () {
          setState(() {});
        },
      );
    _angelAnimation = Tween<double>(begin: 0, end: pi).animate(_controller);
    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: ColorsFoundation.primary200.withOpacity(0.08),
    ).animate(_controller);
    super.initState();
  }

  _onTapButton() {
    if (!isTapped) {
      widget.onTap.call();
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    return InkWell(
      onTap: _onTapButton,
      splashColor: ColorsFoundation.primary200.withOpacity(0.08),
      highlightColor: ColorsFoundation.primary200.withOpacity(0.08),
      borderRadius: BorderRadiusFoundation.all4,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusFoundation.all4,
          color: _colorAnimation.value,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: AnimatedDefaultTextStyle(
                overflow: TextOverflow.ellipsis,
                duration: const Duration(microseconds: 200),
                style: uiKitTheme!.regularTextTheme.body.copyWith(
                  color: isTapped
                      ? ColorsFoundation.primary200
                      : uiKitTheme.colorScheme.bodyTypography,
                ),
                child: Text(
                  widget.title,
                ),
              ),
            ),
            SpacingFoundation.horizontalSpace16,
            Transform.rotate(
              angle: _angelAnimation.value,
              child: Icon(
                ShuffleUiKitIcons.chevronright,
                color: isTapped
                    ? ColorsFoundation.primary200
                    : uiKitTheme.colorScheme.darkNeutral900,
                size: 16.sp,
              ),
            ),
          ],
        ).paddingOnly(
          left: EdgeInsetsFoundation.horizontal16,
          bottom: EdgeInsetsFoundation.vertical8,
          right: EdgeInsetsFoundation.horizontal4,
          top: EdgeInsetsFoundation.vertical8,
        ),
      ),
    );
  }
}
