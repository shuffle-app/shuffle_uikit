import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        GraphicsFoundation.instance.animations.lottie.shuffleLoader1.path,
        repeat: true,
        animate: true,
        package: 'shuffle_uikit',
      ),
    );
  }
}
