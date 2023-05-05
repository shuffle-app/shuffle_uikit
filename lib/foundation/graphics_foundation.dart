import 'package:shuffle_uikit/shuffle_uikit.dart';

class GraphicsFoundation {
  const GraphicsFoundation._();

  static GraphicsFoundation instance = const GraphicsFoundation._();

  $AssetsImagesSvgGen get svg => Assets.images.svg;
  $AssetsImagesPngGen get png => Assets.images.png;
  $AssetsAnimationsGen get animations => Assets.animations;
}
