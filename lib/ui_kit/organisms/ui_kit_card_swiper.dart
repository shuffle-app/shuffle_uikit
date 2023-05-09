import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_card_swiper/src/typedefs.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCardSwiper extends StatelessWidget {
  final List<BaseUiKitSwiperCard> cards;
  final CardSwiperOnSwipe onSwipe;
  final CardSwiperController controller;

  UiKitCardSwiper({
    Key? key,
    required this.cards,
    required this.onSwipe,
    CardSwiperController? controller,
  })  : controller = controller ?? CardSwiperController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardSwiper(
      controller: controller,
      cardsCount: cards.length,
      onSwipe: onSwipe,
      maxAngle: 180,
      numberOfCardsDisplayed: cards.length,
      backCardOffset: Offset.zero,
      padding: EdgeInsets.zero,
      scale: 0.5,
      cardBuilder: (context, index) => cards[index],
    );
  }
}
