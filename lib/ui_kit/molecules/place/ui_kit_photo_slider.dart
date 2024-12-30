import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPhotoSlider extends StatefulWidget {
  final List<BaseUiKitMedia> media;
  final double width;
  final int initialIndex;
  final int maxShowImage;
  final ValueChanged<int?>? onTap;
  final List<Widget>? actions;
  final PlaceWeatherType? weatherType;

  const UiKitPhotoSlider({
    super.key,
    required this.media,
    required this.width,
    this.initialIndex = 0,
    this.maxShowImage = 3,
    this.onTap,
    this.actions,
    this.weatherType,
  });

  @override
  State<UiKitPhotoSlider> createState() => _UiKitPhotoSliderState();
}

class _UiKitPhotoSliderState extends State<UiKitPhotoSlider> with TickerProviderStateMixin {
  final _animDuration = const Duration(milliseconds: 150);
  late CardAnimation _cardAnimation;
  late AnimationController _animationController;

  double get height => widget.width / 1.7495454545;

  final _undoableIndex = Undoable<int?>(null);
  final Queue<CardSwiperDirection> _directionHistory = Queue();
  SwipeType _swipeType = SwipeType.none;
  CardSwiperDirection _detectedDirection = CardSwiperDirection.none;

  int? get _currentIndex => _undoableIndex.state;

  bool showBackStack = false;
  bool showFirstCard = false;

  UiKitThemeData? theme;

  @override
  void initState() {
    super.initState();
    _undoableIndex.state = widget.initialIndex;

    _animationController = AnimationController(
      duration: _animDuration,
      vsync: this,
    )
      ..addListener(_animationListener)
      ..addStatusListener(_animationStatusListener);

    _cardAnimation = CardAnimation(
      _animationController,
    );

    if (widget.media.first.link.startsWith('http') && !kIsWeb) {
      CustomCacheManager.imageInstance.getSingleFile(widget.media.first.link).then((_) {
        if (mounted) {
          setState(() {
            showFirstCard = true;
          });
        } else {
          showFirstCard = true;
        }
        Future.delayed(const Duration(milliseconds: 200), () {
          if (mounted) {
            setState(() {
              showBackStack = true;
            });
          } else {
            showBackStack = true;
          }
        });
      });
    } else {
      showFirstCard = true;
      showBackStack = true;
    }
  }

  @override
  void didChangeDependencies() {
    theme = context.uiKitTheme;
    super.didChangeDependencies();
  }

  _getBackStack([bool reversed = false]) {
    List<BaseUiKitMedia> leftList = widget.media.sublist(0, _currentIndex ?? 0);
    if (leftList.length > widget.maxShowImage) {
      leftList = leftList.sublist(leftList.length - widget.maxShowImage);
    }

    List<BaseUiKitMedia> rightList = widget.media.sublist((_currentIndex ?? 0) + 1, widget.media.length);
    if (rightList.length > widget.maxShowImage) {
      rightList = rightList.sublist(0, widget.maxShowImage);
    }
    final items = rightList.map((e) => _buildRightItem(context, e, rightList.indexOf(e) + 1)).toList().reversed;

    return [
      if (reversed)
        //build right stack if user wants to slide left
        if (rightList.isNotEmpty) ...items,

      //build left stack
      if (leftList.isNotEmpty)
        ...leftList.map((e) => _buildLeftItem(context, e, leftList.indexOf(e) + 1)).toList().reversed,
      if (!reversed)
        //build right stack if user wants to slide right
        if (rightList.isNotEmpty) ...items,
    ];
  }

  Widget _buildFirstItem(BaseUiKitMedia item) {

    return Positioned(
      left: _cardAnimation.left,
      right: widget.media.length == 1 ? 0 : _cardAnimation.right,
      child: GestureDetector(
        onTap: () => widget.onTap?.call(_currentIndex),
        onHorizontalDragUpdate: (tapInfo) {
          final deltaX = tapInfo.delta.dx;
          final isLastCard = _currentIndex! == widget.media.length - 1;
          final isFirstCard = _currentIndex! == 0;
          if (isLastCard && deltaX < 0) return;
          if (isFirstCard && deltaX > 0) return;

          setState(
            () => _cardAnimation.update(
              tapInfo.delta.dx,
            ),
          );
          // }
        },
        onHorizontalDragEnd: (tapInfo) {
          _onEndAnimation();
        },
        child: SliderPhotoCard(
          media: item,
          givenSize: Size(widget.width, height),
          weatherType: widget.weatherType,
        ),
      ),
    );
  }

  Widget _buildLeftItem(BuildContext context, BaseUiKitMedia item, int differenceFromFirstCard) {
    return AnimatedPositioned(
        duration: _animDuration,
        left: 4 * ((_currentIndex ?? 0) + 1) - differenceFromFirstCard * 10,
        // left: 10 / differenceFromFirstCard - 20 + _cardAnimation.difference,
        child: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            color: theme?.bottomSheetTheme.backgroundColor?.withOpacity(0.7),
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: SliderPhotoCard(
            media: item,
            givenSize: Size(widget.width - 55, height * (1 - differenceFromFirstCard * 0.1)),
            weatherType: widget.weatherType,
          ),
        ));
  }

  Widget _buildRightItem(BuildContext context, BaseUiKitMedia item, int differenceFromFirstCard) {
    return AnimatedPositioned(
      duration: _animDuration,
      right: 4 * (5 - (_currentIndex ?? 0) + 1) - differenceFromFirstCard * 10,
      // right:  differenceFromFirstCard/ _cardAnimation.difference.abs(),
      child: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            color: theme?.bottomSheetTheme.backgroundColor?.withOpacity(0.7),
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: SliderPhotoCard(
            media: item,
            givenSize: Size(widget.width - 55, height * (1 - differenceFromFirstCard * 0.1)),
            weatherType: widget.weatherType,
          )),
    );
  }

  void _animationListener() {
    if (_animationController.status == AnimationStatus.forward) {
      setState(_cardAnimation.sync);
    }
  }

  void _animationStatusListener(
    AnimationStatus status,
  ) {
    if (status == AnimationStatus.completed) {
      switch (_swipeType) {
        case SwipeType.swipe:
          _handleCompleteSwipe();
          break;
        default:
          break;
      }
      _reset(
        20 / widget.media.length * (widget.media.length - (_currentIndex ?? 0) + 1),
        20 / widget.media.length * (_currentIndex ?? 0),
      );
    }
  }

  void _handleCompleteSwipe() {
    _undoableIndex.state = (_currentIndex ?? 0) + (_detectedDirection == CardSwiperDirection.left ? 1 : -1);
    _directionHistory.add(_detectedDirection);
  }

  void _reset(double rightMargin, double leftMargin) {
    setState(() {
      _animationController.reset();
      _cardAnimation.reset(rightMargin, leftMargin);
      _swipeType = SwipeType.none;
    });
  }

  void _onEndAnimation() {
    if (_cardAnimation.left.abs() > 50) {
      final direction = _cardAnimation.left.isNegative ? CardSwiperDirection.left : CardSwiperDirection.right;
      _swipe(direction);
    } else {
      _goBack();
    }
  }

  void _swipe(CardSwiperDirection direction) {
    if (_currentIndex == null) return;

    _swipeType = SwipeType.swipe;
    _detectedDirection = direction;
    _cardAnimation.animate(context, direction);
  }

  void _goBack() {
    _swipeType = SwipeType.back;
    _detectedDirection = CardSwiperDirection.none;
    _cardAnimation.animateBack();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    theme ??= context.uiKitTheme;
    if (widget.media.isEmpty) return const SizedBox.shrink();

    final List<Widget> backStack = showBackStack ? _getBackStack(_cardAnimation.right < widget.width / 10) : [];

    return SizedBox(
      height: height,
      width: widget.width,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          ...backStack,
          //ignore: avoid-returning-widgets
          _buildFirstItem(showFirstCard ? widget.media[_currentIndex ?? 0] : UiKitMediaPhoto(link: 'loading')),
          if (widget.actions != null && widget.actions!.isNotEmpty)
            Positioned(
              bottom: 0,
              right: 0,
              height: 0.1.sw,
              width: 1.sw,
              child: ListView.separated(
                reverse: true,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return widget.actions!.elementAt(index);
                },
                separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
                itemCount: widget.actions!.length,
              ),
            ),
        ],
      ),
    );
  }
}

///helpers

class Undoable<T> {
  T get state => _value;

  T? get previousState => _previous?.state;

  set state(T newValue) {
    _previous = Undoable(_value, previousValue: _previous);
    _value = newValue;
  }

  T _value;

  Undoable? _previous;

  Undoable(this._value, {Undoable? previousValue}) : _previous = previousValue;

  void undo() {
    if (_previous != null) {
      _value = _previous!._value;
      _previous = _previous?._previous;
    }
  }
}

extension Range on num {
  bool isBetween(num from, num to) {
    return from <= this && this <= to;
  }
}

// enum CardSwiperDirection { none, left, right, top, bottom }

enum SwipeType {
  none,
  swipe,
  back,
  undo,
}

class CardAnimation {
  final AnimationController animationController;
  double left = 0;
  double right = 20;
  double total = 0;
  late Animation<double> _leftAnimation;
  late Animation<double> _rightAnimation;

  CardAnimation(this.animationController);

  void sync() {
    left = _leftAnimation.value;
    right = _rightAnimation.value;
  }

  void reset(double rightMargin, double leftMargin) {
    animationController.reset();
    left = leftMargin;
    right = rightMargin;
    total = 0;
  }

  void update(double dx) {
    left += dx;
    right -= dx;

    total += dx;
    // updateAngle(inverseAngle);
    // updateScale();
    // updateDifference();
  }

  void animate(BuildContext context, CardSwiperDirection direction) {
    switch (direction) {
      case CardSwiperDirection.left:
        return animateHorizontally(context, false);
      case CardSwiperDirection.right:
        return animateHorizontally(context, true);
      default:
        return;
    }
  }

  void animateHorizontally(BuildContext context, bool isToRight) {
    final screenWidth = MediaQuery.of(context).size.width;

    _leftAnimation = Tween<double>(
      begin: left,
      end: isToRight ? screenWidth : -screenWidth,
    ).animate(animationController);
    _rightAnimation = Tween<double>(
      begin: right,
      end: isToRight ? -screenWidth : screenWidth,
    ).animate(animationController);
    animationController.forward();
  }

  void animateBack() {
    _leftAnimation = Tween<double>(
      begin: left,
      end: 0,
    ).animate(animationController);
    _rightAnimation = Tween<double>(
      begin: right,
      end: 0,
    ).animate(animationController);

    animationController.forward();
  }
}
