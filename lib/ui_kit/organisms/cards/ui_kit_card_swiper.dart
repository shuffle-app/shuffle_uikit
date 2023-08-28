import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_card_swiper/src/typedefs.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCardSwiper extends StatelessWidget {
  final List<BaseUiKitSwiperCard> cards;
  final CardSwiperOnSwipe onSwipe;
  final VoidCallback? onEnd;
  final CardSwiperController controller;
  final Widget? customLikeAnimation;
  final Widget? customDislikeAnimation;

  UiKitCardSwiper({
    Key? key,
    required this.cards,
    required this.onSwipe,
    this.onEnd,
    this.customDislikeAnimation,
    this.customLikeAnimation,
    CardSwiperController? controller,
  })  : controller = controller ?? CardSwiperController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        CardSwiper(
          controller: controller,
          cardsCount: cards.length,
          onSwipe: onSwipe,
          onEnd: onEnd,
          maxAngle: 180,
          isLoop: false,
          // numberOfCardsDisplayed: cards.length,
          backCardOffset: Offset.zero,
          padding: EdgeInsets.zero,
          scale: 0.5,
          cardBuilder: (context, index) => cards[index],
        ),
        if (customLikeAnimation != null)
          Center(
            child: customLikeAnimation,
          ),
        if (customDislikeAnimation != null)
          Center(
            child: customDislikeAnimation,
          ),
      ],
    );
  }
}
