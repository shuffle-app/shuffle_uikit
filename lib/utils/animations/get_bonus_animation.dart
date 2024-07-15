import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GetBonusAnimation extends StatefulWidget {
  const GetBonusAnimation({super.key});

  @override
  State<GetBonusAnimation> createState() => _GetBonusAnimationState();
}

class _GetBonusAnimationState extends State<GetBonusAnimation> with TickerProviderStateMixin {
  late AnimationController _controllerRolling;
  late AnimationController _controllerScaling;
  bool isRolling = true;

  @override
  void initState() {
    _controllerRolling = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    _controllerScaling = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _controllerRolling.addStatusListener(animationStatusListener);
    _controllerRolling.forward();
    super.initState();
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed && isRolling) {
      setState(() {
        isRolling = false;
        _controllerScaling.forward();
      });
    }
  }

  @override
  void dispose() {
    _controllerRolling.removeStatusListener(animationStatusListener);
    _controllerScaling.dispose();
    _controllerRolling.dispose();
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
        alignment: Alignment.centerLeft,
        child: AnimatedBuilder(
          animation: isRolling ? _controllerRolling : _controllerScaling,
          builder: (context, child) {
            return Transform.translate(
                offset: Offset(_controllerRolling.value * 0.40.sw, 0.0),
                child: Transform.rotate(
                  angle: _controllerRolling.value * 15.72,
                  child:
                  Transform.scale(alignment: Alignment.center, scale: _controllerScaling.value + 0.8, child: child),
                ));
          },
          child: image,
        ));
  }
}
