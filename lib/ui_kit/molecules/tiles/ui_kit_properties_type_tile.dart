import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PropertiesTypeAnimatedButton extends StatefulWidget {
  const PropertiesTypeAnimatedButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  State<PropertiesTypeAnimatedButton> createState() => _PropertiesTypeAnimatedButtonState();
}

class _PropertiesTypeAnimatedButtonState extends State<PropertiesTypeAnimatedButton> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _angleAnimation;
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    _angleAnimation = Tween<double>(begin: 0, end: pi).animate(_controller);
    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: ColorsFoundation.primary200.withOpacity(0.08),
    ).animate(_controller);

    if (widget.isSelected) {
      _controller.forward();
    }

    super.initState();
  }

  @override
  void didUpdateWidget(PropertiesTypeAnimatedButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected && !oldWidget.isSelected) {
      _controller.forward();
    } else if (!widget.isSelected && oldWidget.isSelected) {
      _controller.reverse();
    }
  }

  _onTapButton() {
    widget.onTap.call();
  }

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;

    return AnimatedBuilder(
      builder: (context, child) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _onTapButton,
            splashColor: ColorsFoundation.primary200.withOpacity(0.08),
            highlightColor: ColorsFoundation.primary200.withOpacity(0.08),
            borderRadius: BorderRadiusFoundation.all4,
            child: Ink(
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
                      duration: const Duration(milliseconds: 200),
                      style: uiKitTheme!.regularTextTheme.body.copyWith(
                        color: widget.isSelected ? ColorsFoundation.primary200 : uiKitTheme.colorScheme.bodyTypography,
                      ),
                      child: Text(
                        widget.title,
                      ),
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  Transform.rotate(
                    angle: _angleAnimation.value,
                    child: Icon(
                      Icons.chevron_right,
                      color: widget.isSelected ? ColorsFoundation.primary200 : uiKitTheme.colorScheme.darkNeutral900,
                      size: 24.sp,
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
          ),
        );
      },
      animation: _controller,
    );
  }
}
