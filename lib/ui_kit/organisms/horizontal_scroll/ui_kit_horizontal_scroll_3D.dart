import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:shuffle_uikit/foundation/sizes_foundation.dart';

class UiKitHorizontalScroll3D extends StatelessWidget {
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

  const UiKitHorizontalScroll3D({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    double calculatedWidth = SizesFoundation.screenWidth;

    return Center(
      child: Gallery3D(
        controller: Gallery3DController(
            itemCount: itemCount,
            autoLoop: false,
            ellipseHeight: 0,
            minScale: 0.5),
        itemConfig: GalleryItemConfig(
          width: calculatedWidth * 0.75,
          height: calculatedWidth * 0.45,
          radius: 10,
          isShowTransformMask: true,
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: calculatedWidth,
              blurRadius: calculatedWidth,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        width: calculatedWidth,
        height: calculatedWidth * 0.45,
        isClip: true,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
