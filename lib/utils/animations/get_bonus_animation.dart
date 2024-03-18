import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GetBonusAnimation extends StatefulWidget {
  const GetBonusAnimation({super.key});

  @override
  State<GetBonusAnimation> createState() => _GetBonusAnimationState();
}

class _GetBonusAnimationState extends State<GetBonusAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isRolling = true;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    _controller.addStatusListener(animationStatusListener);
    _controller.forward();
    super.initState();
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed && isRolling) {
      setState(() {
        isRolling = false;
        _controller.duration = const Duration(milliseconds: 1000);
      });
      _controller.forward(from: 0);
    } else if (status == AnimationStatus.completed && !isRolling) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(animationStatusListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image = ImageWidget(
      rasterAsset: GraphicsFoundation.instance.png.justCoin,
      height: 40.h,
      width: 40.w,
      fit: BoxFit.contain,
    );

    return Align(
        alignment: isRolling ? Alignment.centerLeft : Alignment.center,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            if (isRolling) {
              return Transform.translate(
                  offset: Offset(_controller.value * 0.42.sw, 0.0),
                  child: Transform.rotate(
                    angle: _controller.value * 15,
                    child: child,
                  ));
            } else {
              return Transform.scale(
                alignment: Alignment.center,
                scale: _controller.value + 1,
                child: child,
              );
            }
          },
          child: image,
        ));
  }
}
