import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_card_swiper/src/typedefs.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCardSwiper extends StatelessWidget {
  final List<BaseUiKitSwiperCard> cards;
  final CardSwiperOnSwipe onSwipe;
  final VoidCallback? onEnd;
  final CardSwiperController controller;
  final AnimationController dislikeController;
  final AnimationController likeController;
  final Size size;

  UiKitCardSwiper({
    Key? key,
    required this.cards,
    required this.onSwipe,
    required this.dislikeController,
    required this.likeController,
    required this.size,
    this.onEnd,
    CardSwiperController? controller,
  })  : controller = controller ?? CardSwiperController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        CardSwiper(
          size: size,
          controller: controller,
          cardsCount: cards.length,
          onSwipe: onSwipe,
          onEnd: onEnd,
          maxAngle: 180,
          isLoop: false,
          numberOfCardsDisplayed: cards.length < 2 ? cards.length : 2,
          backCardOffset: Offset.zero,
          padding: EdgeInsets.zero,
          scale: 0.5,
          cardBuilder: (context, index, horizontalOffsetPercentage, verticalOffsetPercentage) => cards[index],
        ),
        Center(
          child: AnimatedBuilder(
            builder: (context, child) => UiKitHideWrapper(
              shouldHide: dislikeController.value == dislikeController.lowerBound,
              child: child ?? const SizedBox(),
            ),
            animation: dislikeController,
            child: LottieAnimation(
              controller: dislikeController,
              lottiePath: GraphicsFoundation.instance.animations.lottie.brokenHeart.path,
            ),
          ),
        ),
        Center(
          child: AnimatedBuilder(
            builder: (context, child) => UiKitHideWrapper(
              shouldHide: likeController.value == likeController.lowerBound,
              child: child ?? const SizedBox(),
            ),
            animation: likeController,
            child: LottieAnimation(
              lottiePath: GraphicsFoundation.instance.animations.lottie.wholeHeart.path,
              controller: likeController,
            ),
          ),
        )
      ],
    );
  }
}
