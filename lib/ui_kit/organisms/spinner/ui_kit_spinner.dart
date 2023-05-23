import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSpinner extends StatefulWidget {
  final List<String> categories;
  final ScrollController scrollController;
  final ValueChanged<String>? onSpinChangedCategory;

  const UiKitSpinner({
    Key? key,
    required this.categories,
    required this.scrollController,
    this.onSpinChangedCategory,
  }) : super(key: key);

  @override
  State<UiKitSpinner> createState() => _UiKitSpinnerState();
}

class _UiKitSpinnerState extends State<UiKitSpinner> {
  final _animDuration = const Duration(milliseconds: 150);
  final ValueNotifier<double> _notifier = ValueNotifier<double>(0);
  final ValueNotifier<double> _scrollNotifier = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /// to update render objects after first frame
      setState(() {
        _notifier.value = 100;
      });
    });
  }

  void _scrollByPixels({
    required double pixelsToScroll,
    bool animate = false,
  }) {
    final maxScrollOffset = widget.scrollController.position.maxScrollExtent;
    final computedOffset = widget.scrollController.offset - pixelsToScroll;
    double scrollOffset = 0;
    if (computedOffset >= 0) scrollOffset = computedOffset;
    if (computedOffset >= maxScrollOffset) scrollOffset = maxScrollOffset;
    if (animate) {
      widget.scrollController.animateTo(
        scrollOffset,
        duration: _animDuration,
        curve: Curves.decelerate,
      );
    } else {
      widget.scrollController.jumpTo(scrollOffset);
    }
  }

  void _shouldSwitchCategory({required double currentOffset}) {
    final screenWidth = 1.sw;
    final nearestElementIndex = (currentOffset / screenWidth).round();
    if (nearestElementIndex < 0) {
      widget.onSpinChangedCategory?.call(widget.categories.first);
    } else if (nearestElementIndex >= widget.categories.length) {
      widget.onSpinChangedCategory?.call(widget.categories.last);
    } else {
      widget.onSpinChangedCategory?.call(widget.categories.elementAt(nearestElementIndex));
    }
  }

  @override
  void dispose() {
    _notifier.dispose();
    _scrollNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final availableWidth = size.maxWidth;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UiKitHorizontalScrollableList(
              scrollController: widget.scrollController,
              children: widget.categories
                  .map<Widget>(
                    (e) => SizedBox(
                      width: 1.sw,
                      child: Center(
                        child: Text(
                          e,
                          style: context.uiKitTheme?.boldTextTheme.title1,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizesFoundation.screenWidth <= 275 ? SpacingFoundation.verticalSpace16 : SpacingFoundation.verticalSpace24,
            SizedBox(
              height: 155,
              width: 1.sw,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: (availableWidth / 2) - 345,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        final delta = details.delta.dx;
                        if (widget.scrollController.offset == 0 && !delta.isNegative) return;
                        _scrollNotifier.value = details.localPosition.dx;
                        _notifier.value += delta / 500;
                        _scrollByPixels(
                          pixelsToScroll: delta,
                        );
                      },
                      onPanEnd: (details) {
                        _shouldSwitchCategory(
                          currentOffset: widget.scrollController.offset,
                        );
                      },
                      child: AnimatedBuilder(
                        animation: _notifier,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _notifier.value,
                            // duration: _animDuration,
                            child: child,
                          );
                        },
                        child: Center(
                          child: ImageWidget(
                            svgAsset: GraphicsFoundation.instance.svg.spinnerWheel,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
