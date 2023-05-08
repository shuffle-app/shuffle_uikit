import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCardSwiper extends StatefulWidget {
  final List<BaseUiKitSwiperCard> cards;
  final ValueChanged<int> onSwipe;

  const UiKitCardSwiper({
    Key? key,
    required this.cards,
    required this.onSwipe,
  }) : super(key: key);

  @override
  State<UiKitCardSwiper> createState() => _UiKitCardSwiperState();
}

class _UiKitCardSwiperState extends State<UiKitCardSwiper> {
  final CardSwiperController controller = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    return CardSwiper(
      controller: controller,
      cardsCount: widget.cards.length,
      onSwipe: (prevIndex, currentIndex, direction) async {
        return true;
      },
      onUndo: (prevIndex, currentIndex, direction) {
        return true;
      },
      maxAngle: 180,
      numberOfCardsDisplayed: widget.cards.length,
      backCardOffset: Offset.zero,
      isVerticalSwipingEnabled: false,
      padding: EdgeInsets.zero,
      scale: 0.5,
      cardBuilder: (context, index) => widget.cards[index],
    );
  }
}
