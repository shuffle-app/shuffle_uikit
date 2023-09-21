import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class RollingDiceButton extends StatefulWidget {
  final ValueChanged<Set<int>> onPressed;
  final int length;
  final Duration? animationDuration;

  const RollingDiceButton({super.key, required this.onPressed, required this.length, this.animationDuration});

  @override
  State<RollingDiceButton> createState() => _RollingDiceButtonState();
}

class _RollingDiceButtonState extends State<RollingDiceButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late Random _random;
  int _diceNumber = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 800),
      vsync: this,
      value: 1,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _random = Random();
  }

  void _rollDice() {
    // _controller.
    _controller.forward(from: 0);
    setState(() {
      _diceNumber = _random.nextInt(6) + 1;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return context.gradientButton(
      data: BaseUiKitButtonData(
        onPressed: () {
          _rollDice();
          widget.onPressed(List.generate(_diceNumber, (index) => _random.nextInt(widget.length)).toSet());
        },
        icon: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: -_diceNumber * 360 / (_animation.value + 1) * (pi / 180),
              child: Transform.scale(
                scale: sin(_animation.value * 3) + 1,
                // scale: sin(_animation.value + 1 / 2),
                // scale: 1,
                child: child,
              ),
            );
          },
          child: ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.dice,
            height: 17.h,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
