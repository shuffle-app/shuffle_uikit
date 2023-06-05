import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LoadingWidget extends StatelessWidget {
  final Function(BuildContext context)? onLoad;

  const LoadingWidget({
    Key? key,
    this.onLoad
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onLoad != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
          onLoad!(context));
    }

    return Center(
      child: Hero(
        tag: 'hero-loading',
        child: LottieBuilder.asset(
        GraphicsFoundation.instance.animations.lottie.shuffleLoader1.path,
        repeat: true,
        animate: true,
        package: 'shuffle_uikit',
      )),
    );
  }
}
