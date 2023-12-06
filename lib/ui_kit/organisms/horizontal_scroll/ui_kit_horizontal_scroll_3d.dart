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
    final screenWidth = SizesFoundation.screenWidth;
    final screenHeight = SizesFoundation.screenHeight;
    final isBigScreen = screenWidth > 375;
    double calculatedWidth = screenWidth * 0.85;
    double calculatedHeight = screenHeight * 0.25704;
    if (isBigScreen) {
      calculatedWidth = screenWidth * 0.85;
      calculatedHeight = screenHeight * 0.2175704;
    }

    return Center(
      child: Gallery3D(
        controller: Gallery3DController(
          itemCount: itemCount,
          autoLoop: false,
          ellipseHeight: 0,
          minScale: 0.5,
        ),
        itemConfig: GalleryItemConfig(
          width: calculatedWidth,
          height: calculatedHeight,
          radius: 10,
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 100,
            ),
          ],
        ),
        width: screenWidth,
        height: calculatedHeight,
        isClip: true,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
