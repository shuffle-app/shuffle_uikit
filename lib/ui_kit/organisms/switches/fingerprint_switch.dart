import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

import '../../content_wrappers/ui_kit_border_wrapper.dart';

class FingerprintSwitch extends StatelessWidget {
  const FingerprintSwitch({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = 0.27.sw;
    final height = width * 1.68;

    return Stack(
      children: [
        UiKitBorderWrapper(
          height: height,
          child: ClipRRect(
            borderRadius: BorderRadiusFoundation.all28,
            child: Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()..scale(1.0, 0.7),
              child: ImageWidget(
                width: double.infinity,
                rasterAsset: GraphicsFoundation.instance.png.dubaiSilhouette,
                fit: BoxFit.cover,
                color: ColorsFoundation.surface2,
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
