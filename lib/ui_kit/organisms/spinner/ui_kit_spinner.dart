import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:html/parser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shuffle_uikit/foundation/audio_foundation.dart';
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
  final ValueNotifier<double> _rotationNotifier = ValueNotifier<double>(0);
  final ValueNotifier<double> _lastScrollPositionOffsetNotifier = ValueNotifier<double>(0);
  final ValueNotifier<double> _scrollStartNotifier = ValueNotifier<double>(0);
  final _player = AudioPlayer();
  SpinningType _spinningType = SpinningType.wheel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.scrollController.addListener(_scrollListener);
      _player.setAsset(
        AudioFoundation.instance.audio.rachetClick,
        package: 'shuffle_uikit',
      );
    });
  }

  void setSpinningType(SpinningType type) {
    setState(() => _spinningType = type);
  }

  void _enableFeedback() {
    _player.play().then((value) => _player.seek(Duration.zero));
    HapticFeedback.lightImpact();
  }

  void _scrollListener() {
    if (widget.scrollController.offset.toInt() % 20 == 0) {
      _enableFeedback();
    }

    if (_spinningType == SpinningType.categories) {
      final scrollDelta = widget.scrollController.offset - _lastScrollPositionOffsetNotifier.value;
      _rotationNotifier.value -= scrollDelta / 200;
    }
    _lastScrollPositionOffsetNotifier.value = widget.scrollController.offset;
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
    _lastScrollPositionOffsetNotifier.value = scrollOffset;
  }

  void _shouldSwitchCategory([bool onEndNotified = false]) {
    final currentOffset = widget.scrollController.offset;
    final screenWidth = 1.sw;
    final nearestElementIndex = (currentOffset / screenWidth).round();
    if (nearestElementIndex <= 0) {
      widget.onSpinChangedCategory?.call(widget.categories.first);
    } else if (nearestElementIndex >= widget.categories.length) {
      widget.onSpinChangedCategory?.call(widget.categories.last);
    } else {
      widget.onSpinChangedCategory?.call(widget.categories.elementAt(nearestElementIndex));
    }
    final nearestElementOffset = nearestElementIndex * screenWidth;
    if (onEndNotified) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) => widget.scrollController.animateTo(
            nearestElementOffset,
            duration: _animDuration,
            curve: Curves.decelerate,
          ));
    } else {
      widget.scrollController.animateTo(
        nearestElementOffset,
        duration: _animDuration,
        curve: Curves.decelerate,
      );
    }
    _lastScrollPositionOffsetNotifier.value = nearestElementOffset;
    _enableFeedback();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    _rotationNotifier.dispose();
    _lastScrollPositionOffsetNotifier.dispose();
    _scrollStartNotifier.dispose();
    _player.dispose();
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
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: (details) {
                if (_spinningType != SpinningType.categories) setState(() => _spinningType = SpinningType.categories);
              },
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (notification) {
                  if (_spinningType != SpinningType.wheel) _shouldSwitchCategory(true);

                  return true;
                },
                child: UiKitHorizontalScrollableList(
                  scrollController: widget.scrollController,
                  children: widget.categories
                      .map<Widget>(
                        (e) => SizedBox(
                          width: 1.sw,
                          child: Center(
                            child: Text(
                              parseFragment(e).text ?? e,
                              style: context.uiKitTheme?.boldTextTheme.title1,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
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
                        if (_spinningType != SpinningType.wheel) setSpinningType(SpinningType.wheel);
                        final delta = details.delta.dx;
                        final inScrollBeginning = widget.scrollController.offset == 0 && !delta.isNegative;
                        final inScrollEnd =
                            widget.scrollController.offset == widget.scrollController.position.maxScrollExtent && delta.isNegative;
                        if (inScrollBeginning || inScrollEnd) return;
                        if (details.localPosition.dx.toInt() % 20 == 0) _enableFeedback();
                        _rotationNotifier.value += delta / 200;
                        _scrollByPixels(
                          pixelsToScroll: delta,
                        );
                      },
                      onPanStart: (details) {
                        _scrollStartNotifier.value = widget.scrollController.offset;
                      },
                      onPanEnd: (details) {
                        _shouldSwitchCategory(false);
                      },
                      child: AnimatedBuilder(
                        animation: _rotationNotifier,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _rotationNotifier.value,
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

enum SpinningType { categories, wheel }

class UiKitSpinnerChangeData {
  final String category;
  final SpinningType spinType;

  UiKitSpinnerChangeData({
    required this.category,
    required this.spinType,
  });
}
