import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shuffle_uikit/foundation/graphics_foundation.dart';

class UiKitShuffleLogo extends StatefulWidget {
  const UiKitShuffleLogo({Key? key}) : super(key: key);

  @override
  State<UiKitShuffleLogo> createState() => _UiKitShuffleLogoState();
}

class _UiKitShuffleLogoState extends State<UiKitShuffleLogo> {
  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      GraphicsFoundation.instance.animations.lottie.shuffleLoader1.path,
      package: 'shuffle_uikit',
    );
  }
}
