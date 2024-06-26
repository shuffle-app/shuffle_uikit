import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as image_lib;

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

  UiKitViewFinderState state = UiKitViewFinderState.initial;

  void completeCrop() {
    state = UiKitViewFinderState.croppingDone;
    notifyListeners();
  }

  void cropImage() {
    state = UiKitViewFinderState.cropping;
    notifyListeners();
  }
}

class CropImageInBackgroundData {
  final image_lib.Image initialImage;
  final int cropStartX;
  final int cropStartY;
  final int cropWidth;
  final int cropHeight;

  CropImageInBackgroundData({
    required this.initialImage,
    required this.cropStartX,
    required this.cropStartY,
    required this.cropWidth,
    required this.cropHeight,
  });
}

Future<Uint8List> _cropImageInBackground(CropImageInBackgroundData data) async {
  return Uint8List.fromList(
    image_lib.encodePng(
      image_lib.copyCrop(
        data.initialImage,
        x: data.cropStartX,
        y: data.cropStartY,
        width: data.cropWidth,
        height: data.cropHeight,
      ),
    ),
  );
}

class UiKitPictureViewFinder extends StatefulWidget {
  final void Function(Uint8List)? onCropCompleted;
  final Size viewPortAvailableSize;
  final Uint8List imageBytes;
  final UiKitPictureViewFinderController controller;
  final Axis? viewFinderOrientation;

  const UiKitPictureViewFinder({
    super.key,
    required this.imageBytes,
    required this.viewPortAvailableSize,
    required this.controller,
    this.viewFinderOrientation,
    this.onCropCompleted,
  });

  @override
  State<UiKitPictureViewFinder> createState() => _UiKitPictureViewFinderState();
}

class _UiKitPictureViewFinderState extends State<UiKitPictureViewFinder> {
  bool get isHorizontalPicture => imageOriginalSize.width > imageOriginalSize.height;

  bool get isVerticalPicture => imageOriginalSize.width < imageOriginalSize.height;

  bool get isSquareImage => imageOriginalAspectRatio >= 0.99 && imageOriginalAspectRatio <= 1.01;

  // width is 1.7495454545 times bigger than height
  double get cropAspectRatio {
    if (widget.viewFinderOrientation != null) {
      if (widget.viewFinderOrientation == Axis.horizontal) return 1.7495454545;
      if (widget.viewFinderOrientation == Axis.vertical) return 0.78125;
    }
    if (isHorizontalPicture) return 1.7495454545;

    return 0.78125;
  }

  double get imageOriginalAspectRatio => imageOriginalSize.width / imageOriginalSize.height;

  Size get imageOriginalSize => Size(image?.width.toDouble() ?? 0, image?.height.toDouble() ?? 0);

  Size fittedImageSize = Size.zero;

  image_lib.Image? image;

  double get viewFinderAndImageWidthDiff {
    final difference = fittedImageSize.width - _positionAndSize.value.size.width;
    if (difference.isNegative) return 0;
    return difference;
  }

  double get viewFinderAndImageHeightDiff {
    final difference = fittedImageSize.height - _positionAndSize.value.size.height;
    if (difference.isNegative) return 0;
    return difference;
  }

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

  void cropImage(Uint8List data) async {
    if (image == null) return;
    final cropStartX = (_positionAndSize.value.position.dx / (fittedImageSize.width / imageOriginalSize.width)).ceil().toInt();
    final cropStartY = (_positionAndSize.value.position.dy / (fittedImageSize.height / imageOriginalSize.height)).ceil().toInt();
    final cropWidth = (_positionAndSize.value.size.width / (fittedImageSize.width / imageOriginalSize.width)).ceil().toInt();
    final cropHeight = (_positionAndSize.value.size.height / (fittedImageSize.height / imageOriginalSize.height)).ceil().toInt();
    final imageBytes = await compute(
      _cropImageInBackground,
      CropImageInBackgroundData(
        initialImage: image!,
        cropStartX: cropStartX,
        cropStartY: cropStartY,
        cropWidth: cropWidth,
        cropHeight: cropHeight,
      ),
    );
    widget.controller.completeCrop();
    widget.onCropCompleted?.call(imageBytes);
  }

  final ValueNotifier<SizeAndPosition> _positionAndSize = ValueNotifier<SizeAndPosition>(SizeAndPosition(
    position: Offset.zero,
    size: Size.zero,
  ));

  bool imageLoadingError = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      widget.controller.addListener(() {
        if (widget.controller.state == UiKitViewFinderState.cropping) cropImage(widget.imageBytes);
      });
      final bytes = widget.imageBytes;
      final imageFromBytes = image_lib.decodeImage(bytes);
      dev.log('Trying to decode image from bytes: $imageFromBytes');
      if (imageFromBytes == null) return;
      dev.log('Trying to decode image from bytes success');
      image = imageFromBytes;
      if (isVerticalPicture) {
        /// fit height of the image to the [widget.viewPortAvailableSize] saving aspect ratio
        double fittedHeight = widget.viewPortAvailableSize.height;
        if (fittedHeight >= imageOriginalSize.height) fittedHeight = imageOriginalSize.height;
        final fittedWidth = _setupViewFinderWidth(fittedHeight, customAspectRatio: imageOriginalAspectRatio);
        if (fittedWidth > widget.viewPortAvailableSize.width) {
          fittedImageSize = Size(
            widget.viewPortAvailableSize.width,
            _setupViewFinderHeight(widget.viewPortAvailableSize.width, customAspectRatio: imageOriginalAspectRatio),
          );
        } else {
          fittedImageSize = Size(fittedWidth, fittedHeight);
        }
      } else if (isHorizontalPicture) {
        double fittedWidth = widget.viewPortAvailableSize.width;
        if (fittedWidth >= imageOriginalSize.width) fittedWidth = imageOriginalSize.width;
        double fittedHeight = _setupViewFinderHeight(fittedWidth, customAspectRatio: imageOriginalAspectRatio);
        if (fittedHeight > widget.viewPortAvailableSize.height) {
          fittedImageSize = Size(
            _setupViewFinderWidth(widget.viewPortAvailableSize.height, customAspectRatio: imageOriginalAspectRatio),
            widget.viewPortAvailableSize.height,
          );
        } else {
          fittedImageSize = Size(fittedWidth, fittedHeight);
        }
      } else if (isSquareImage) {
        double fittedWidth = widget.viewPortAvailableSize.width;
        if (fittedWidth >= imageOriginalSize.width) fittedWidth = imageOriginalSize.width;
        double fittedHeight = _setupViewFinderHeight(fittedWidth, customAspectRatio: imageOriginalAspectRatio);
        if (fittedHeight > widget.viewPortAvailableSize.height) {
          fittedImageSize = Size(
            _setupViewFinderWidth(widget.viewPortAvailableSize.height, customAspectRatio: imageOriginalAspectRatio),
            widget.viewPortAvailableSize.height,
          );
        } else {
          fittedImageSize = Size(fittedWidth, fittedHeight);
        }
      }

      if (widget.viewFinderOrientation == Axis.horizontal) {
        if (!isHorizontalPicture) {
          final viewFinderHeight = _setupViewFinderHeight(fittedImageSize.width);
          final viewFinderWidth = _setupViewFinderWidth(viewFinderHeight);
          _positionAndSize.value = SizeAndPosition(
            size: Size(viewFinderWidth, viewFinderHeight),
            position: Offset.zero,
          );
        } else if (isSquareImage) {
          final viewFinderWidth = _setupViewFinderWidth(fittedImageSize.height / 2);
          final viewFinderHeight = _setupViewFinderHeight(viewFinderWidth);
          _positionAndSize.value = SizeAndPosition(
            size: Size(viewFinderWidth, viewFinderHeight),
            position: Offset.zero,
          );
        } else {
          final viewFinderHeight = _setupViewFinderHeight(fittedImageSize.height);
          final viewFinderWidth = _setupViewFinderWidth(viewFinderHeight);
          _positionAndSize.value = SizeAndPosition(
            size: Size(viewFinderWidth, viewFinderHeight),
            position: Offset.zero,
          );
        }
      } else if (widget.viewFinderOrientation == Axis.vertical) {
        if (!isVerticalPicture) {
          final viewFinderWidth = _setupViewFinderWidth(fittedImageSize.height);
          final viewFinderHeight = _setupViewFinderHeight(viewFinderWidth);
          _positionAndSize.value = SizeAndPosition(
            size: Size(viewFinderWidth, viewFinderHeight),
            position: Offset.zero,
          );
        } else if (isSquareImage) {
          final viewFinderHeight = _setupViewFinderHeight(fittedImageSize.width / 2);
          final viewFinderWidth = _setupViewFinderWidth(viewFinderHeight);
          _positionAndSize.value = SizeAndPosition(
            size: Size(viewFinderWidth, viewFinderHeight),
            position: Offset.zero,
          );
        } else {
          final viewFinderHeight = _setupViewFinderHeight(fittedImageSize.width);
          final viewFinderWidth = _setupViewFinderWidth(viewFinderHeight);
          _positionAndSize.value = SizeAndPosition(
            size: Size(viewFinderWidth, viewFinderHeight),
            position: Offset.zero,
          );
        }
      }

      dev.log('Initialization finished');
      dev.log('image original orientation: ${isHorizontalPicture ? 'horizontal' : 'vertical'}');
      dev.log('externally set orientation: ${widget.viewFinderOrientation == Axis.horizontal ? 'horizontal' : 'vertical'}');
      dev.log('square image: $isSquareImage');
      dev.log('fittedImageSize: $fittedImageSize');
      dev.log('imageOriginalSize: $imageOriginalSize');
      dev.log('crop size: ${_positionAndSize.value.size}');
      dev.log('crop offset: ${_positionAndSize.value.position}');
      dev.log('available size: ${widget.viewPortAvailableSize}');
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
              builder: (context, child) => Container(
                clipBehavior: Clip.hardEdge,
                width: _positionAndSize.value.size.width,
                height: _positionAndSize.value.size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusFoundation.all16,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: child,
              ),
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

class CroppedImageData {
  final Uint8List croppedFileBytes;
  final Uint8List originalFileBytes;
  final bool originalImageWasPreview;
  final String? mimeType;
  final String? filename;

  CroppedImageData({
    required this.croppedFileBytes,
    required this.originalFileBytes,
    this.originalImageWasPreview = false,
    this.mimeType,
    this.filename,
  });
}

enum UiKitViewFinderState { initial, cropping, croppingDone }
