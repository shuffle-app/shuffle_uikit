import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AchievementsCarouselSlider extends StatefulWidget {
  final List<Widget> listOfItems;
  final ValueChanged<int?>? isCenterWidget;

  const AchievementsCarouselSlider({
    super.key,
    required this.listOfItems,
    this.isCenterWidget,
  });

  @override
  AchievementsCarouselSliderState createState() =>
      AchievementsCarouselSliderState();
}

class AchievementsCarouselSliderState
    extends State<AchievementsCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
        itemCount: widget.listOfItems.length,
        itemBuilder: (context, index, realIndex) {
          final double scale = _currentIndex == index ? 1.0 : 0.8;
          final double translateY = _currentIndex == index ? 0.0 : -10.0;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            transform: Matrix4.identity()..translate(0.0, translateY),
            child: Transform.scale(
              scale: scale,
              child: widget.listOfItems[index],
            ),
          );
        },
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
              widget.isCenterWidget?.call(_currentIndex);
            });
          },
          viewportFraction: 1.sw <= 380 ? 0.5 : 0.45,
          initialPage: 0,
        ),
      ),
    );
  }
}
