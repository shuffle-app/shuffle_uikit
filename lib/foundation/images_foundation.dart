import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuffle_uikit/tokens/assets.gen.dart';

class GraphicsFoundation {
  const GraphicsFoundation._();

  static GraphicsFoundation instance = const GraphicsFoundation._();

  //TODO: add width and height support
  SvgPicture svgPicture({
    required SvgGenImage asset,
    BoxFit? fit,
    double? height,
    double? width,
  }) =>
      asset.svg(
        package: 'shuffle_uikit',
        fit: fit ?? BoxFit.none,
        height: height,
        width: width,
      );

  Image rasterPicture({
    required AssetGenImage asset,
    BoxFit? fit,
    double? height,
    double? width,
  }) =>
      asset.image(
        package: 'shuffle_uikit',
        fit: fit ?? BoxFit.none,
        height: height,
        width: width,
      );
}
