import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

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
    double screenWidth = SizesFoundation.screenWidth;

    return Center(
      child: Gallery3D(
        controller: Gallery3DController(
          itemCount: itemCount,
          autoLoop: false,
          ellipseHeight: 0,
          minScale: 0.5,
        ),
        itemConfig: GalleryItemConfig(
          width: screenWidth * 0.85,
          height: screenWidth * 0.5,
          radius: 10,
        ),
        width: screenWidth,
        height: screenWidth * 0.5,
        isClip: true,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
