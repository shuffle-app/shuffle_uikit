import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInfiniteCarouselWithPagination<T> extends StatefulWidget {
  final PagingController<int, T> pagingController;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Size size;

  const UiKitInfiniteCarouselWithPagination({
    super.key,
    required this.pagingController,
    required this.itemBuilder,
    required this.size,
  });

  @override
  State<UiKitInfiniteCarouselWithPagination<T>> createState() => _UiKitInfiniteCarouselWithPaginationState<T>();
}

class _UiKitInfiniteCarouselWithPaginationState<T> extends State<UiKitInfiniteCarouselWithPagination<T>> {
  InfiniteScrollController carouselController = InfiniteScrollController();

  double get itemExtent => widget.size.width * 0.85;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carouselController.addListener(_pageListener);
    });
  }

  void _pageListener() {
    if (carouselController.position.pixels >= carouselController.position.maxScrollExtent - 1.sw) {
      print('carouselController.position.pixels >= carouselController.position.maxScrollExtent - 1.sw worked');
      print('I need to fetch more');
    }
    if (carouselController.selectedItem >= widget.pagingController.items!.length - 3) {
      print('carouselController.selectedItem >= widget.pagingController.itemList!.length -3 worked');
      print('I need to fetch more');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;

    return SizedBox.fromSize(
      size: widget.size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          InfiniteCarousel.builder(
            controller: carouselController,
            itemCount: widget.pagingController.items?.length ?? 0,
            itemExtent: itemExtent,
            physics: const PageViewTypeScrollPhysics(),
            loop: true,
            velocityFactor: 1,
            axisDirection: Axis.horizontal,
            itemBuilder: (context, index, realIndex) {
              final lastItem = index == widget.pagingController.items!.length - 1;
              final item = widget.pagingController.items![index];
              T nextItem = item;
              if (lastItem) {
                nextItem = widget.pagingController.items!.first;
              } else {
                nextItem = widget.pagingController.items![index + 1];
              }

              return AnimatedBuilder(
                animation: carouselController,
                builder: (context, child) {
                  final itemIsSelected = carouselController.selectedItem == index;
                  final leftFromSelected = index == carouselController.selectedItem - 1;
                  final rightFromSelected = index == carouselController.selectedItem + 1;
                  double dx = -itemExtent / 4;
                  if (itemIsSelected) {
                    dx = 0;
                  } else if (leftFromSelected || (lastItem && !rightFromSelected)) {
                    dx = itemExtent / 4;
                  }
                  final scale = itemIsSelected ? 1.0 : 0.8;

                  if (rightFromSelected) return const SizedBox.shrink();

                  return AnimatedScale(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.linear,
                    scale: scale,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.decelerate,
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..translate(dx),
                      child: SizedBox(
                        height: widget.size.height,
                        width: widget.size.width,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              right: -itemExtent * 0.75,
                              child: AnimatedScale(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.linear,
                                scale: itemIsSelected ? 0.8 : 1,
                                child: SizedBox(
                                  width: itemExtent,
                                  height: widget.size.height,
                                  child: widget.itemBuilder(context, nextItem, lastItem ? 0 : index + 1),
                                ),
                              ),
                            ),
                            child!,
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: widget.itemBuilder(context, item, index),
              );
            },
          ),
          Positioned.fill(
            top: 0,
            left: 0,
            child: IgnorePointer(
              child: Container(
                height: 0.25.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [
                      0.0,
                      0.5,
                      1,
                    ],
                    colors: [
                      (colorScheme?.surface ?? ColorsFoundation.surface).withOpacity(0.5),
                      Colors.transparent,
                      (colorScheme?.surface ?? ColorsFoundation.surface).withOpacity(0.5),
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
