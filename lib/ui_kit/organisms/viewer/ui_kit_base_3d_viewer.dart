import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBase3DViewer extends StatelessWidget {
  final String localPath;

  const UiKitBase3DViewer({super.key, required this.localPath});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return ModelViewer(
      // backgroundColor: theme?.colorScheme.background ?? UiKitColors.surface1,
      src: 'file://$localPath',
      // alt: 'A 3D model of a person',
      ar: true,
      xrEnvironment: true,
      arPlacement: ArPlacement.floor,
      // touchAction: TouchAction.panY,
      arModes: ['scene-viewer', 'webxr', 'quick-look'],
      autoRotate: true,
      // iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
      disableZoom: true,
      // shadowSoftness: 4,
      // shadowIntensity: 2,
      exposure: 3,
      environmentImage:
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/i/a57581b5-938b-4dc4-b6af-64d51df7f8d4/d6vv3z5-7593e8e2-bc13-44df-a1d1-0ae5fedb492c.jpg',
    );
  }
}
