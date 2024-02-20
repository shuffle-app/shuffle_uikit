import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSpinner extends StatefulWidget {
  final ScrollController scrollController;
  final PagingController<int, String> pagingController;
  final ValueChanged<String>? onSpinChangedCategory;
  final DateTimeRange? filterDate;
  final ValueChanged<DateTimeRange?>? onDateRangeChanged;

  const UiKitSpinner({
    Key? key,
    required this.scrollController,
    required this.pagingController,
    this.onSpinChangedCategory,
    this.filterDate,
    this.onDateRangeChanged,
  }) : super(key: key);

  @override
  State<UiKitSpinner> createState() => _UiKitSpinnerState();
}

class _UiKitSpinnerState extends State<UiKitSpinner> {
  final _animDuration = const Duration(milliseconds: 150);
  final _rotationNotifier = ValueNotifier<double>(0);
  final _transitionNotifier = ValueNotifier<double>(0);
  final _lastRotationPosition = ValueNotifier<double>(0);
  final _scrollStartNotifier = ValueNotifier<double>(0);
  final _lastScrollPositionOffsetNotifier = ValueNotifier<double>(0);
  SpinningType _spinningType = SpinningType.wheel;
  SpinningGesture _spinningGesture = SpinningGesture.spin;
  bool _isInteracting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.scrollController.addListener(_scrollListener);
    });
    _rotationNotifier.addListener(_rotationListener);
    _transitionNotifier.addListener(_transitionListener);
  }

  void _transitionListener() {}

  void _rotationListener() {
    final rotationDelta = (_rotationNotifier.value - _lastRotationPosition.value).abs();

    if (rotationDelta > 0.015) {
      FeedbackIsolate.instance.addEvent(FeedbackIsolateHaptics());
    } else {
      final newScrollDelta = widget.scrollController.offset - _scrollStartNotifier.value;

      if (newScrollDelta.abs() % 10 <= 1) {
        FeedbackIsolate.instance.addEvent(FeedbackIsolateHaptics());
      }
    }
  }

  void setSpinningType(SpinningType type) {
    setState(() => _spinningType = type);
  }

  void setSpinningGesture(SpinningGesture gesture) {
    setState(() => _spinningGesture = gesture);
  }

  void changeInteractingState(bool isInteracting) {
    setState(() => _isInteracting = isInteracting);
  }

  void _scrollListener() {
    final offset = widget.scrollController.offset;
    final scrollDelta = offset - _lastScrollPositionOffsetNotifier.value;
    _lastRotationPosition.value = _rotationNotifier.value;
    _rotationNotifier.value -= scrollDelta / 200;
    // if (_spinningType == SpinningType.categories) {
    // }

    _lastScrollPositionOffsetNotifier.value = offset;
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
    FeedbackIsolate.instance.addEvent(SystemSoundIsolateRachetClick());
    final currentOffset = widget.scrollController.offset;
    final screenWidth = 1.sw;
    final nearestElementIndex = (currentOffset / screenWidth).round();
    String value = '';
    if (nearestElementIndex <= 0) {
      value = widget.pagingController.itemList!.first;
    } else if (nearestElementIndex >= widget.pagingController.itemList!.length) {
      value = widget.pagingController.itemList!.last;
    } else {
      value = widget.pagingController.itemList!.elementAt(nearestElementIndex);
    }
    widget.onSpinChangedCategory?.call(value);
    final nearestElementOffset = nearestElementIndex * screenWidth;
    if (onEndNotified) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => widget.scrollController.animateTo(
          nearestElementOffset,
          duration: _animDuration * 2,
          curve: Curves.decelerate,
        ),
      );
    } else {
      widget.scrollController.animateTo(
        nearestElementOffset,
        duration: _animDuration * 2,
        curve: Curves.decelerate,
      );
    }
    _lastScrollPositionOffsetNotifier.value = nearestElementOffset;
  }

  double _lastRotationValue = 0;

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    _rotationNotifier.dispose();
    _lastScrollPositionOffsetNotifier.dispose();
    _scrollStartNotifier.dispose();
    _transitionNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const maxSpinnerUpValue = -60.0;
    final colorScheme = context.uiKitTheme?.colorScheme;
    // return LayoutBuilder(
    //   builder: (context, size) {
    //     final availableWidth = size.maxWidth;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //TODO remove const height
        SizedBox(
          height: 24.h,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanDown: (details) {
              if (_spinningType != SpinningType.categories) {
                setSpinningType(SpinningType.categories);
              }
            },
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (notification) {
                if (_spinningType != SpinningType.wheel) {
                  _shouldSwitchCategory(true);
                }

                return true;
              },
              child: UiKitHorizontalScrollableList<String>(
                pagingController: widget.pagingController,
                scrollController: widget.scrollController,
                physics: _spinningType == SpinningType.categories
                    ? const PageScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                itemBuilder: (_, item, index) => SizedBox(
                  width: 1.sw,
                  child: Center(
                    child: AutoSizeText(
                      () {
                        final category = parseFragment(item).text ?? item;

                        return category.substring(0, 1).toUpperCase() + category.substring(1);
                      }(),
                      maxLines: 2,
                      style: context.uiKitTheme?.boldTextTheme.title1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // )
                // .toList(),
              ),
            ),
          ),
        ),
        SizesFoundation.screenWidth <= 275 ? SpacingFoundation.verticalSpace16 : SpacingFoundation.verticalSpace24,
        SizedBox(
          height: 155,
          // height: 100.h,
          width: 1.sw,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: (1.sw / 2) - 345,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    if (!_isInteracting) {
                      changeInteractingState(true);
                      setSpinningGesture(
                          details.delta.dy != 0 && details.delta.dy < 0 ? SpinningGesture.up : SpinningGesture.spin);
                    }
                    if (widget.pagingController.itemList?.isEmpty ?? false) return;

                    if (_spinningGesture == SpinningGesture.up) {
                      if (_transitionNotifier.value > maxSpinnerUpValue) {
                        _transitionNotifier.value += details.delta.dy / 5;
                      }
                      return;
                    }

                    if (_spinningType != SpinningType.wheel) setSpinningType(SpinningType.wheel);
                    final delta = details.delta.dx;
                    final inScrollBeginning = widget.scrollController.offset == 0 && !delta.isNegative;
                    final inScrollEnd =
                        widget.scrollController.offset == widget.scrollController.position.maxScrollExtent &&
                            delta.isNegative;
                    if (inScrollBeginning || inScrollEnd) return;
                    // if (details.localPosition.dx.toInt() % 20 == 0) _enableFeedback();
                    _rotationNotifier.value += delta / 200;
                    _scrollByPixels(
                      pixelsToScroll: delta * 1.5,
                    );
                  },
                  onPanStart: (details) {
                    if (widget.pagingController.itemList?.isEmpty ?? false) return;

                    _scrollStartNotifier.value = widget.scrollController.offset;
                  },
                  onPanEnd: (details) async {
                    changeInteractingState(false);
                    if (widget.pagingController.itemList?.isEmpty ?? false) return;

                    if (_transitionNotifier.value != 0) {
                      if (_transitionNotifier.value <= maxSpinnerUpValue + 10) {
                        _transitionNotifier.value = maxSpinnerUpValue;
                      } else {
                        _transitionNotifier.value = 0;
                        return;
                      }
                      FeedbackIsolate.instance.addEvent(SystemSoundIsolateRachetClick());
                      unawaited(showDateRangePickerDialog(context, initialDateRange: widget.filterDate).then((value) {
                        widget.onDateRangeChanged?.call(value);
                        _transitionNotifier.value = 0;
                        // Future.delayed(const Duration(milliseconds: 200), () => _transitionNotifier.value = 0);
                      }));
                      return;
                    }

                    final atEnd = widget.scrollController.position.atEdge;

                    final inertionScroll = details.velocity.pixelsPerSecond.dx / 4;
                    await widget.scrollController.animateTo(
                      widget.scrollController.offset - inertionScroll,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.decelerate,
                    );

                    if (!atEnd) _shouldSwitchCategory(false);
                  },
                  child: AnimatedBuilder(
                    animation: Listenable.merge([_rotationNotifier, _transitionNotifier]),
                    builder: (context, child) {
                      if ((_rotationNotifier.value - _lastRotationValue).abs() >= 0.8) {
                        // _enableFeedback();
                        WidgetsBinding.instance.addPostFrameCallback((timeStamp) => setState(() {
                              _lastRotationValue = _rotationNotifier.value;
                            }));
                      }

                      final Matrix4 transform = Matrix4.identity();
                      if (_transitionNotifier.value != 0) {
                        transform.translate(0.0, _transitionNotifier.value, 0.0);
                      }
                      if (_rotationNotifier.value != 0) {
                        transform.rotateZ(_rotationNotifier.value);
                      }

                      return Transform(
                        transform: transform,
                        alignment: Alignment.center,
                        // duration: _animDuration,
                        child: child,
                      );
                      // return Transform.rotate(
                      //   angle: _rotationNotifier.value,
                      //   // duration: _animDuration,
                      //   child: child,
                      // );
                    },
                    child: Center(
                      child: ImageWidget(
                        svgAsset: GraphicsFoundation.instance.svg.spinnerWheel,
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.filterDate != null)
                Positioned(
                    top: 45.h,
                    child: Text(
                      widget.filterDate?.toRangeString() ?? '',
                      style: context.uiKitTheme?.regularTextTheme.caption4.copyWith(color: colorScheme?.primary),
                      textAlign: TextAlign.center,
                    ))
              else
                Positioned(
                    top: 45.h,
                    child: UiKitFloatingAnimation(
                      applyX: false,
                      child: RotatedBox(
                          quarterTurns: 1,
                          child: Transform.scale(
                              scaleY: 1.2,
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ))),
                    ))
            ],
          ),
        ),
      ],
    );
    // },
    // );
  }
}

enum SpinningType { categories, wheel }

enum SpinningGesture { spin, up }

class UiKitSpinnerChangeData {
  final String category;
  final SpinningType spinType;

  UiKitSpinnerChangeData({
    required this.category,
    required this.spinType,
  });
}

extension ToString on DateTimeRange {
  String toRangeString() {
    return '${DateFormat('dd.MM.yyyy').format(start)} - ${DateFormat('dd.MM.yyyy').format(end)}';
  }
}
