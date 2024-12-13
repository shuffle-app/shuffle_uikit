import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PopUpPhotoView extends ModalRoute<void> {
  final List<String> images;
  final int initialIndex;
  final String heroTag;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => ColorsFoundation.surface1.withOpacity(0.9);

  @override
  String get barrierLabel => 'null';

  @override
  bool get maintainState => true;

  PopUpPhotoView({
    required this.images,
    required this.initialIndex,
    required this.heroTag,
  });

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: PhotoDialog(
        tag: heroTag,
        images: images,
        initialIndex: initialIndex,
      ),
    );
  }
}

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

  int currentIndex = 0;
  double offsetY = 0.0;
  bool isAnimating = false;

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

    _animationController.addListener(() {
      _transformationController.value = _animation.value;
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isAnimating = false;
        });
      }
    });
  }

  @override
  void dispose() {
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
    if (!isAnimating) {
      setState(() {
        offsetY += details.primaryDelta ?? 0.0;
      });
    }
  }

  void _handleVerticalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity! > 250 || details.primaryVelocity! < -250) {
      setState(() {
        offsetY =
            details.primaryVelocity! > 0 ? MediaQuery.of(context).size.height : -MediaQuery.of(context).size.height;
        isAnimating = true;
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        context.pop();
      });
    } else {
      setState(() {
        offsetY = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          GestureDetector(
            onVerticalDragUpdate: _handleVerticalDragUpdate,
            onVerticalDragEnd: _handleVerticalDragEnd,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                  _animateResetScale();
                  offsetY = 0.0;
                });
              },
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                final isCurrentPage = index == currentIndex;

                return Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      top: offsetY,
                      child: InteractiveViewer(
                        transformationController: _transformationController,
                        panEnabled: isCurrentPage && !isAnimating,
                        scaleEnabled: isCurrentPage && !isAnimating,
                        minScale: 1.0,
                        maxScale: 4.0,
                        onInteractionEnd: (_) {
                          if (_transformationController.value != Matrix4.identity() && !isAnimating) {
                            _animateResetScale();
                          }
                        },
                        child: Hero(
                          tag: widget.tag,
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
          Positioned(
            right: SpacingFoundation.horizontalSpacing8,
            top: SpacingFoundation.verticalSpacing8,
            child: GestureDetector(
              onTap: isAnimating
                  ? null
                  : () {
                      context.pop();
                    },
              child: ImageWidget(
                width: 14.w,
                height: 14.w,
                iconData: ShuffleUiKitIcons.x,
                color: context.uiKitTheme?.colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
