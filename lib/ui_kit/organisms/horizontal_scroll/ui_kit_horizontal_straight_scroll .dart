import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class UiKitHorizontalStraightScroll extends StatelessWidget {
  final List<Widget> children;

  const UiKitHorizontalStraightScroll({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: children,
      options: CarouselOptions(
        enableInfiniteScroll: false,
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.75,
        aspectRatio: 2,
        initialPage: 2,
      ),
    );
  }
}
