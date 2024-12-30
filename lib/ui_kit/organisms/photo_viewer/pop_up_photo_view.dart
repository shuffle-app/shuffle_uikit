import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PhotoDialog extends StatefulWidget {
  final List<String> images;
  final int initialIndex;
  final String tag;

  const PhotoDialog({
    super.key,
    required this.images,
    required this.initialIndex,
    required this.tag,
  });

  @override
  State<PhotoDialog> createState() => _PhotoDialogState();
}

class _PhotoDialogState extends State<PhotoDialog> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late TransformationController _transformationController;

  late AnimationController _animationController;
  late Animation<Matrix4> _animation;

  double offsetY = 0.0;
  int currentIndex = 0;
  int activePointers = 0;

  bool isAnimating = false;
  bool isPageChanging = false;
  bool isTwoFingerGesture = false;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    _transformationController = TransformationController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _setupAnimationListeners();
  }

  void _setupAnimationListeners() {
    _animationController.addListener(_onAnimationControllerUpdate);
    _animationController.addStatusListener(_onAnimationStatusUpdate);
  }

  void _removeAnimationListeners() {
    _animationController.removeListener(_onAnimationControllerUpdate);
    _animationController.removeStatusListener(_onAnimationStatusUpdate);
  }

  void _onAnimationControllerUpdate() {
    _transformationController.value = _animation.value;
  }

  void _onAnimationStatusUpdate(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        isAnimating = false;
      });
    }
  }

  @override
  void dispose() {
    _removeAnimationListeners();
    _pageController.dispose();
    _transformationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _animateResetScale() {
    setState(() {
      isAnimating = true;
    });

    _animation = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward(from: 0);
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    if (!isAnimating && !isTwoFingerGesture && !isPageChanging) {
      setState(() {
        offsetY += details.primaryDelta ?? 0.0;
      });
    }
  }

  void _handleVerticalDragEnd(DragEndDetails details) {
    if (!isTwoFingerGesture && !isPageChanging) {
      if (details.primaryVelocity! > 250 || details.primaryVelocity! < -250) {
        setState(() {
          offsetY = details.primaryVelocity! > 0 ? 1.sh : -1.sh;
          isAnimating = true;
        });

        Future.delayed(const Duration(milliseconds: 150), () {
          context.pop();
        });
      } else {
        setState(() {
          offsetY = 0.0;
        });
      }
    }
  }

  void _handlePointerDown(PointerDownEvent event) {
    setState(() {
      activePointers++;
      if (activePointers == 2) {
        isTwoFingerGesture = true;
      }
    });
  }

  void _handlePointerUp(PointerUpEvent event) {
    setState(() {
      activePointers = (activePointers - 1).clamp(0, double.infinity).toInt();
      if (activePointers < 2) {
        isTwoFingerGesture = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;
    return ColoredBox(
        color: colorScheme?.surface1 ?? Colors.black,
        child: SafeArea(
          child: Stack(
            children: [
              Listener(
                onPointerDown: _handlePointerDown,
                onPointerUp: _handlePointerUp,
                child: GestureDetector(
                  onVerticalDragUpdate: _handleVerticalDragUpdate,
                  onVerticalDragEnd: _handleVerticalDragEnd,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        isPageChanging = true;
                        currentIndex = index;
                        _animateResetScale();
                        offsetY = 0.0;
                      });

                      Future.delayed(const Duration(milliseconds: 600), () {
                        setState(() {
                          isPageChanging = false;
                        });
                      });
                    },
                    itemCount: widget.images.length,
                    itemBuilder: (context, index) {
                      final isCurrentPage = index == currentIndex;

                      final String lastPartOfTag = widget.tag.split('--').last;
                      final String dynamicHeroTag = '${widget.images[index]}--${lastPartOfTag}';

                      return Stack(
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            top: offsetY,
                            child: InteractiveViewer(
                              transformationController: _transformationController,
                              panEnabled: isCurrentPage && !isAnimating && !isTwoFingerGesture,
                              scaleEnabled: isCurrentPage && !isAnimating,
                              minScale: 1.0,
                              maxScale: 4.0,
                              onInteractionEnd: (_) {
                                if (_transformationController.value != Matrix4.identity() && !isAnimating) {
                                  _animateResetScale();
                                }
                              },
                              child: Hero(
                                tag: dynamicHeroTag,
                                transitionOnUserGestures: true,
                                child: ImageWidget(
                                  width: 1.sw,
                                  height: 0.95.sh,
                                  link: widget.images[index],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing2);
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
