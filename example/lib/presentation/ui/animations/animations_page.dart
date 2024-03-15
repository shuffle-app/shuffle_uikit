import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          Container(
            height: 180,
            width: 0.8.sw,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusFoundation.all24,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      Image.asset(GraphicsFoundation.instance.png.mockSwiperCard.path, package: 'shuffle_uikit').image,
                )),
            child: const UiKitLongTapHintAnimation(),
          ),
          // LottieAnimation(
          //   lottiePath: GraphicsFoundation.instance.animations.lottie.wholeHeart.path,
          // ),
          // LottieAnimation(
          //   lottiePath: GraphicsFoundation.instance.animations.lottie.brokenHeart.path,
          // ),
        ],
      ),
    );
  }
}
