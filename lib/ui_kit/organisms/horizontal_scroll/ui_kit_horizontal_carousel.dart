import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHorizontalPicturesCarousel extends StatefulWidget {
  final List<String> pictureLinks;
  final Size carouselSize;
  final bool autoPlay;
  final Duration? autoPlayDuration;

  const UiKitHorizontalPicturesCarousel({
    Key? key,
    required this.pictureLinks,
    required this.carouselSize,
    this.autoPlay = false,
    this.autoPlayDuration,
  }) : super(key: key);

  @override
  State<UiKitHorizontalPicturesCarousel> createState() => _UiKitHorizontalPicturesCarouselState();
}

class _UiKitHorizontalPicturesCarouselState extends State<UiKitHorizontalPicturesCarousel> {
  final pageController = PageController(
    viewportFraction: 1 / 3,
    keepPage: false,
  );
  Timer? autoPlayTimer;
  final Duration defaultAutoPlayDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pageController.jumpTo(0.3.sw);
      if (widget.autoPlay) {
        autoPlayTimer = Timer.periodic(widget.autoPlayDuration ?? defaultAutoPlayDuration, (timer) {
          if (pageController.hasClients) {
            pageController.nextPage(
              duration: const Duration(milliseconds: 750),
              curve: Curves.decelerate,
            );
          }
          if (pageController.page == widget.pictureLinks.length.toDouble() - 2) {
            pageController.animateTo(0.3.sw, duration: const Duration(milliseconds: 750), curve: Curves.decelerate);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: widget.carouselSize,
      child: PageView.builder(
        allowImplicitScrolling: true,
        controller: pageController,
        itemCount: widget.pictureLinks.length,
        physics: const ClampingScrollPhysics(),
        // pageSnapping: true,
        // padEnds: false,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double scale = 0;
              double dyOffset = 0;
              if (pageController.position.haveDimensions) {
                scale = index - (pageController.page ?? 0);
                dyOffset = index - (pageController.page ?? 0);
                scale = 1 - (scale.abs() * 0.35).clamp(-1, 1);
                dyOffset = (dyOffset * 0.25).clamp(-1, 1);
                dyOffset = dyOffset.abs();
              }

              return Transform.translate(
                offset: Offset(0, dyOffset * widget.carouselSize.height * 0.7),
                child: Transform.scale(
                  scale: scale,
                  child: child,
                ),
              );
            },
            child: UiKitReactionPreview(imagePath: widget.pictureLinks.elementAt(index)),
          );
        },
      ),
    );
  }
}
