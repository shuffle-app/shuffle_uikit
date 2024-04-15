import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as imageLib;

import '../../shuffle_uikit.dart';

class SizeAndPosition {
  final Size size;
  final Offset position;

  SizeAndPosition({
    required this.size,
    required this.position,
  });

  SizeAndPosition copyWith({
    Size? size,
    Offset? position,
  }) {
    return SizeAndPosition(
      size: size ?? this.size,
      position: position ?? this.position,
    );
  }
}

class UiKitPictureViewFinderController extends ChangeNotifier {
  UiKitPictureViewFinderController() : super();

  void cropImage() {
    notifyListeners();
  }
}

class UiKitPictureViewFinder extends StatefulWidget {
  final void Function(Uint8List)? onCropCompleted;
  final Size viewPortAvailableSize;
  final Uint8List imageBytes;
  final UiKitPictureViewFinderController controller;

  const UiKitPictureViewFinder({
    Key? key,
    required this.imageBytes,
    required this.viewPortAvailableSize,
    required this.controller,
    this.onCropCompleted,
  }) : super(key: key);

  @override
  State<UiKitPictureViewFinder> createState() => _UiKitPictureViewFinderState();
}

class _UiKitPictureViewFinderState extends State<UiKitPictureViewFinder> {
  bool get isHorizontalPicture => imageOriginalSize.width > imageOriginalSize.height;

  bool get isVerticalPicture => imageOriginalSize.width < imageOriginalSize.height;

  // width is 1.7495454545 times bigger than height
  double get cropAspectRatio {
    if (isHorizontalPicture) return 1.7495454545;

    return 0.78125;
  }

  double get imageOriginalAspectRatio => imageOriginalSize.width / imageOriginalSize.height;

  Size get imageOriginalSize => Size(image?.width.toDouble() ?? 0, image?.height.toDouble() ?? 0);

  Size fittedImageSize = Size.zero;

  imageLib.Image? image;

  double get viewFinderAndImageWidthDiff => fittedImageSize.width - _positionAndSize.value.size.width;

  double get viewFinderAndImageHeightDiff => fittedImageSize.height - _positionAndSize.value.size.height;

  double _setupViewFinderWidth(double height, {double? customAspectRatio}) {
    double width = height * (customAspectRatio ?? cropAspectRatio);
    if (width > imageOriginalSize.width) {
      width = imageOriginalSize.width;
      _positionAndSize.value = _positionAndSize.value.copyWith(
        size: Size(width, width / (customAspectRatio ?? cropAspectRatio)),
      );
    }
    return width;
  }

  double _setupViewFinderHeight(double width, {double? customAspectRatio}) {
    double height = width / (customAspectRatio ?? cropAspectRatio);
    if (height > imageOriginalSize.height) {
      height = imageOriginalSize.height;
      _positionAndSize.value = _positionAndSize.value.copyWith(
        size: Size(height * (customAspectRatio ?? cropAspectRatio), height),
      );
    }
    return height;
  }

  void cropImage(Uint8List data) {
    if (image == null) return;
    final cropStartX = (_positionAndSize.value.position.dx / (fittedImageSize.width / imageOriginalSize.width)).ceil().toInt();
    final cropStartY = (_positionAndSize.value.position.dy / (fittedImageSize.height / imageOriginalSize.height)).ceil().toInt();
    final cropWidth = (_positionAndSize.value.size.width / (fittedImageSize.width / imageOriginalSize.width)).ceil().toInt();
    final cropHeight = (_positionAndSize.value.size.height / (fittedImageSize.height / imageOriginalSize.height)).ceil().toInt();
    final imageBytes = Uint8List.fromList(
      imageLib.encodePng(
        imageLib.copyCrop(
          image!,
          x: cropStartX,
          y: cropStartY,
          width: cropWidth,
          height: cropHeight,
        ),
      ),
    );
    widget.onCropCompleted?.call(imageBytes);
  }

  late final ValueNotifier<SizeAndPosition> _positionAndSize = ValueNotifier<SizeAndPosition>(
    SizeAndPosition(
      position: Offset(
        (imageOriginalSize.width - imageOriginalSize.width) / 4,
        (imageOriginalSize.height - imageOriginalSize.height) / 4,
      ),
      size: imageOriginalSize,
    ),
  );

  bool imageLoadingError = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      widget.controller.addListener(() {
        cropImage(widget.imageBytes);
      });
      final bytes = widget.imageBytes;
      final imageFromBytes = imageLib.decodeImage(bytes);
      if (imageFromBytes == null) return;
      image = imageFromBytes;
      if (isVerticalPicture) {
        /// fit height of the image to the [widget.viewPortAvailableSize] saving aspect ratio
        final fittedHeight = widget.viewPortAvailableSize.height;
        final fittedWidth = _setupViewFinderWidth(fittedHeight, customAspectRatio: imageOriginalAspectRatio);
        if (fittedWidth > widget.viewPortAvailableSize.width) {
          fittedImageSize = Size(
            widget.viewPortAvailableSize.width,
            _setupViewFinderHeight(widget.viewPortAvailableSize.width, customAspectRatio: imageOriginalAspectRatio),
          );
        } else {
          fittedImageSize = Size(fittedWidth, fittedHeight);
        }
      }
      if (isHorizontalPicture) {
        /// fit width of the image to the [widget.viewPortAvailableSize] saving aspect ratio
        final fittedWidth = widget.viewPortAvailableSize.width;
        final fittedHeight = _setupViewFinderHeight(fittedWidth, customAspectRatio: imageOriginalAspectRatio);
        if (fittedHeight > widget.viewPortAvailableSize.height) {
          fittedImageSize = Size(
            _setupViewFinderWidth(widget.viewPortAvailableSize.height, customAspectRatio: imageOriginalAspectRatio),
            widget.viewPortAvailableSize.height,
          );
        } else {
          fittedImageSize = Size(fittedWidth, fittedHeight);
        }
      }

      final viewFinderHeight = _setupViewFinderHeight(fittedImageSize.width / 2);
      final viewFinderWidth = _setupViewFinderWidth(viewFinderHeight);
      _positionAndSize.value = SizeAndPosition(
        size: Size(viewFinderWidth, viewFinderHeight),
        position: Offset.zero,
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    _positionAndSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) return const SizedBox();

    // return Column(
    //   children: [
    //     SizedBox.fromSize(
    //       size: widget.viewPortSize,
    //       child: Crop(
    //         controller: _cropController,
    //         image: widget.imageBytes,
    //         onCropped: (data) {
    //           print('cropped data: ${data.length}');
    //           widget.onCropCompleted?.call(data);
    //         },
    //       ),
    //     ),
    //     SpacingFoundation.verticalSpace24,
    //     context.button(
    //       data: BaseUiKitButtonData(
    //         text: 'show result',
    //         onPressed: () => cropImage(widget.imageBytes),
    //       ),
    //     ),
    //   ],
    // );

    if (imageLoadingError) {
      return SizedBox.fromSize(
        size: widget.viewPortAvailableSize,
        child: const Center(child: UiKitBigPhotoErrorWidget()),
      );
    }

    return SizedBox.fromSize(
      size: fittedImageSize,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: _positionAndSize,
            builder: (context, child) {
              final viewFinderWidth = _positionAndSize.value.size.width;
              final viewFinderHeight = _positionAndSize.value.size.height;
              final viewFinderX = _positionAndSize.value.position.dx;
              final viewFinderY = _positionAndSize.value.position.dy;

              return ClipPath(
                clipper: CropInnerAreaClipper(
                  Rect.fromCenter(
                    center: Offset(
                      viewFinderX + viewFinderWidth / 2,
                      viewFinderY + viewFinderHeight / 2,
                    ),
                    width: viewFinderWidth,
                    height: viewFinderHeight,
                  ),
                  16,
                ),
                child: child,
              );
            },
            child: ImageWidget(
              imageBytes: widget.imageBytes,
              fit: BoxFit.contain,
            ),
          ),
          AnimatedBuilder(
            animation: _positionAndSize,
            builder: (context, child) {
              return ClipPath(
                clipper: CropInnerAreaClipper(
                  Rect.fromLTWH(
                    _positionAndSize.value.position.dx,
                    _positionAndSize.value.position.dy,
                    _positionAndSize.value.size.width,
                    _positionAndSize.value.size.height,
                  ),
                  16,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _positionAndSize,
            builder: (context, child) {
              final viewFinderWidth = _positionAndSize.value.size.width;
              final viewFinderHeight = _positionAndSize.value.size.height;
              final viewFinderX = _positionAndSize.value.position.dx;
              final viewFinderY = _positionAndSize.value.position.dy;

              return ClipPath(
                clipper: CropOuterAreaClipper(
                  Rect.fromCenter(
                    center: Offset(
                      viewFinderX + viewFinderWidth / 2,
                      viewFinderY + viewFinderHeight / 2,
                    ),
                    width: viewFinderWidth,
                    height: viewFinderHeight,
                  ),
                  16,
                ),
                child: child,
              );
            },
            child: ImageWidget(
              imageBytes: widget.imageBytes,
              fit: BoxFit.contain,
            ),
          ),
          AnimatedBuilder(
            animation: _positionAndSize,
            builder: (context, child) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    left: _positionAndSize.value.position.dx,
                    top: _positionAndSize.value.position.dy,
                    right: fittedImageSize.width - (_positionAndSize.value.size.width + _positionAndSize.value.position.dx),
                    bottom: fittedImageSize.height - _positionAndSize.value.size.height - _positionAndSize.value.position.dy,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onPanUpdate: (details) {
                        final dx = max(0, _positionAndSize.value.position.dx + details.delta.dx).toDouble();
                        final dy = max(0, _positionAndSize.value.position.dy + details.delta.dy).toDouble();
                        final atRightEdge = dx >= viewFinderAndImageWidthDiff;
                        final atBottomEdge = dy >= viewFinderAndImageHeightDiff;
                        if (viewFinderAndImageWidthDiff.isNegative || viewFinderAndImageHeightDiff.isNegative) return;

                        if (atBottomEdge && atRightEdge) {
                          /// view finder at bottom and right edge
                          _positionAndSize.value = _positionAndSize.value.copyWith(
                            position: Offset(viewFinderAndImageWidthDiff, viewFinderAndImageHeightDiff),
                          );
                        } else if (atRightEdge) {
                          /// view finder at right edge
                          _positionAndSize.value = _positionAndSize.value.copyWith(
                            position: Offset(viewFinderAndImageWidthDiff, dy),
                          );
                        } else if (atBottomEdge) {
                          /// view finder at bottom edge
                          _positionAndSize.value = _positionAndSize.value.copyWith(
                            position: Offset(dx, viewFinderAndImageHeightDiff),
                          );
                        } else {
                          /// view finder at top or left edge
                          _positionAndSize.value = _positionAndSize.value.copyWith(
                            position: Offset(dx, dy),
                          );
                        }
                      },
                      child: child,
                    ),
                  ),
                ],
              );
            },
            child: AnimatedBuilder(
              animation: _positionAndSize,
              builder: (context, child) {
                final width = _positionAndSize.value.size.width;
                final height = _positionAndSize.value.size.height;

                return Container(
                  clipBehavior: Clip.hardEdge,
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusFoundation.all16,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: child,
                );
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      dragStartBehavior: DragStartBehavior.down,
                      onPanUpdate: (details) {
                        final viewFinderWidth = _positionAndSize.value.size.width;
                        final width = viewFinderWidth + details.delta.dx;
                        final height = _setupViewFinderHeight(width);
                        if (width > fittedImageSize.width || height > fittedImageSize.height) return;
                        _positionAndSize.value = _positionAndSize.value.copyWith(
                          size: Size(width, height),
                        );
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        final viewFinderHeight = _positionAndSize.value.size.height;
                        final height = viewFinderHeight + details.delta.dy;
                        final width = _setupViewFinderWidth(height);
                        if (width > fittedImageSize.width || height > fittedImageSize.height) return;
                        _positionAndSize.value = _positionAndSize.value.copyWith(
                          size: Size(width, height),
                        );
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CropInnerAreaClipper extends CustomClipper<Path> {
  CropInnerAreaClipper(this.rect, this.radius);

  final Rect rect;
  final double radius;

  @override
  Path getClip(Size size) {
    return Path()
      ..addPath(
        Path()
          ..moveTo(rect.left, rect.top + radius)
          ..arcToPoint(Offset(rect.left + radius, rect.top), radius: Radius.circular(radius))
          ..lineTo(rect.right - radius, rect.top)
          ..arcToPoint(Offset(rect.right, rect.top + radius), radius: Radius.circular(radius))
          ..lineTo(rect.right, rect.bottom - radius)
          ..arcToPoint(Offset(rect.right - radius, rect.bottom), radius: Radius.circular(radius))
          ..lineTo(rect.left + radius, rect.bottom)
          ..arcToPoint(Offset(rect.left, rect.bottom - radius), radius: Radius.circular(radius))
          ..close(),
        Offset.zero,
      )
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CropOuterAreaClipper extends CustomClipper<Path> {
  CropOuterAreaClipper(this.rect, this.radius);

  final Rect rect;
  final double radius;

  @override
  Path getClip(Size size) {
    return Path()
      ..addPath(
        Path()
          ..moveTo(rect.left, rect.top + radius)
          ..arcToPoint(Offset(rect.left + radius, rect.top), radius: Radius.circular(radius))
          ..lineTo(rect.right - radius, rect.top)
          ..arcToPoint(Offset(rect.right, rect.top + radius), radius: Radius.circular(radius))
          ..lineTo(rect.right, rect.bottom - radius)
          ..arcToPoint(Offset(rect.right - radius, rect.bottom), radius: Radius.circular(radius))
          ..lineTo(rect.left + radius, rect.bottom)
          ..arcToPoint(Offset(rect.left, rect.bottom - radius), radius: Radius.circular(radius))
          ..close(),
        Offset.zero,
      )
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
