import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BouncingIconButtonAnimation extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final double iconPadding;

  const BouncingIconButtonAnimation({
    super.key,
    this.onPressed,
    required this.icon,
    required this.iconPadding,
  });

  @override
  State<BouncingIconButtonAnimation> createState() => _BouncingIconButtonAnimationState();
}

class _BouncingIconButtonAnimationState extends State<BouncingIconButtonAnimation> {
  final _animationDuration = const Duration(milliseconds: 250);
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: _animationDuration,
      child: Material(
        shape: const CircleBorder(),
        color: Colors.white.withOpacity(0.1),
        child: InkWell(
          onTapDown: (tapDetails) async {
            setState(() => _scale = 1.4);
            await Future.delayed(_animationDuration ~/ 2);
            setState(() => _scale = 1.0);
            await Future.delayed(_animationDuration ~/ 2);
            setState(() => _scale = 1.2);
          },
          onTapCancel: () async {
            setState(() => _scale = 0.7);
            await Future.delayed(_animationDuration ~/ 2);
            setState(() => _scale = 1.0);
          },
          onTap: () async {
            setState(() => _scale = 1.2);
            await Future.delayed(_animationDuration ~/ 2);
            setState(() => _scale = 0.8);
            await Future.delayed(_animationDuration);
            setState(() => _scale = 1.0);
            widget.onPressed?.call();
          },
          borderRadius: BorderRadiusFoundation.max,
          child: Ink(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                child: widget.icon.paddingAll(widget.iconPadding),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
