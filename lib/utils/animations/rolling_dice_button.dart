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
  late AnimationController _controller;
  late Animation<double> _animation;
  late Random _random;
  int _diceNumber = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _random = Random();
  }

  void _rollDice() {
    _controller.forward();
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
              angle: _diceNumber * 360 / 6 * _animation.value,
              child: Transform.scale(
                  scale: (cos(_animation.value) + 1) / 2,
                  child: ImageWidget(
                    svgAsset: GraphicsFoundation.instance.svg.dice,
                  )),
            );
          },
        ),
      ),
    );
  }
}
