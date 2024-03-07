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
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.forward();
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed && isRolling) {
      setState(() {
        isRolling = false;
        _controller = AnimationController(vsync: this);
        _controller.forward();
      });
    } else if (status == AnimationStatus.completed && !isRolling) {
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
    final image = ImageWidget(
      rasterAsset: GraphicsFoundation.instance.png.justCoin,
    );

    final Matrix4 transform = Matrix4.identity();
    if (isRolling) {
      transform.rotateZ(1);
      transform.translate(0, 0, 1);
    }

    return isRolling
        ? Transform(
            transform: transform,
            child: image,
          )
        : UiKitScaleAnimation(controller: _controller, child: image);
  }
}
