import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          LottieAnimation(
            lottiePath: GraphicsFoundation.instance.animations.lottie.wholeHeart.path,
          ),
          LottieAnimation(
            lottiePath: GraphicsFoundation.instance.animations.lottie.brokenHeart.path,
          ),
        ],
      ),
    );
  }
}
