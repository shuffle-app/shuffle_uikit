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
    return LayoutBuilder(
      builder: (context, size) {
        final allCards = [
          ...cards,
          UiKitLastSwiperCard(),
        ];

        return CardSwiper(
          controller: controller,
          cardsCount: allCards.length,
          onSwipe: (prev, current, direction) async {
            if (prev == allCards.length - 1) return false;

            return true;
          },
          maxAngle: 180,
          isLoop: false,
          numberOfCardsDisplayed: allCards.length,
          backCardOffset: Offset.zero,
          padding: EdgeInsets.zero,
          scale: 0.5,
          cardBuilder: (context, index) => allCards[index],
        );
      },
    );
  }
}
