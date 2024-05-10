import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFotoramioViewer extends StatefulWidget {
  final List<String> photos;

  const UiKitFotoramioViewer({
    Key? key,
    required this.photos,
  }) : super(key: key);

  @override
  State<UiKitFotoramioViewer> createState() => _UiKitFotoramioViewerState();
}

class _UiKitFotoramioViewerState extends State<UiKitFotoramioViewer> {
  InfiniteScrollController pageController = InfiniteScrollController();

  double get itemExtent => 0.4.sw;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pageController.jumpTo(0.3.sw);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;

    return SizedBox(
      height: 0.25.sh,
      width: 1.sw,
      child: Stack(
        fit: StackFit.expand,
        children: [
          InfiniteCarousel.builder(
            controller: pageController,
            itemCount: widget.photos.length,
            itemExtent: itemExtent,
            anchor: 0.5,
            physics: const InfiniteScrollPhysics(),
            loop: true,
            axisDirection: Axis.horizontal,
            // center: true,
            itemBuilder: (context, index, realIndex) {
              final currentOffset = itemExtent * realIndex;

              return AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  final diff = (pageController.offset - currentOffset);
                  const maxPadding = 24.0;
                  final carouselRatio = 0.45.sw / maxPadding;

                  return Padding(
                    padding: EdgeInsets.only(
                      top: (diff / carouselRatio).abs(),
                      bottom: (diff / carouselRatio).abs(),
                    ),
                    child: child,
                  );
                },
                child: ImageWidget(
                  link: widget.photos[index],
                  width: 1.sw,
                  height: 0.25.sh,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          IgnorePointer(
            child: Positioned.fill(
              top: 0,
              left: 0,
              child: Container(
                height: 0.25.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      colorScheme?.surface1 ?? ColorsFoundation.surface1,
                      Colors.black.withOpacity(0.0),
                      colorScheme?.surface1 ?? ColorsFoundation.surface1,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
