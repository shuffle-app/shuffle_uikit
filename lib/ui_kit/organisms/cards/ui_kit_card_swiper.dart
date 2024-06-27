import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_card_swiper/src/typedefs.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

//ignore_for_file: implementation_imports

class UiKitCardSwiper extends StatelessWidget {
  final List<BaseUiKitSwiperCard> cards;
  final CardSwiperOnSwipe onSwipe;
  final VoidCallback? onEnd;
  final CardSwiperController controller;
  final AnimationController dislikeController;
  final AnimationController likeController;
  final Size size;

  UiKitCardSwiper({
    super.key,
    required this.cards,
    required this.onSwipe,
    required this.dislikeController,
    required this.likeController,
    required this.size,
    this.onEnd,
    CardSwiperController? controller,
  })  : controller = controller ?? CardSwiperController();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
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
            cardBuilder: (context, index, horizontalOffsetPercentage, verticalOffsetPercentage) {
              final card = cards.elementAt(index);
              if (card is UiKitSwiperAdCard) return Center(child: card);

              return card;
            },
          ),
          Center(
            child: AnimatedBuilder(
              builder: (context, child) {
                final shouldHide = dislikeController.value == dislikeController.lowerBound ||
                    dislikeController.value == dislikeController.upperBound;

                if (shouldHide) return SpacingFoundation.none;

                return UiKitHideWrapper(
                  shouldHide: shouldHide,
                  child: child ?? const SizedBox(),
                );
              },
              animation: dislikeController,
              child: LottieAnimation(
                controller: dislikeController,
                lottiePath: GraphicsFoundation.instance.animations.lottie.brokenHeart.path,
              ),
            ),
          ),
          Center(
            child: AnimatedBuilder(
              builder: (context, child) {
                final shouldHide =
                    likeController.value == likeController.lowerBound || likeController.value == likeController.upperBound;

                if (shouldHide) return SpacingFoundation.none;

                return UiKitHideWrapper(
                  shouldHide: shouldHide,
                  child: child ?? const SizedBox(),
                );
              },
              animation: likeController,
              child: LottieAnimation(
                lottiePath: GraphicsFoundation.instance.animations.lottie.wholeHeart.path,
                controller: likeController,
              ),
            ),
          )
        ],
      ),
    );
  }
}
