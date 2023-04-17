import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuffle_uikit/tokens/assets.gen.dart';

class GraphicsFoundation {
  const GraphicsFoundation._();

  static GraphicsFoundation instance = const GraphicsFoundation._();

  //TODO: add width and height support
  SvgPicture svgPicture({required SvgGenImage asset, BoxFit? fit}) => asset.svg(
        package: 'shuffle_uikit',
        fit: fit ?? BoxFit.none,
      );

  Image rasterPicture({required AssetGenImage asset, BoxFit? fit}) => asset.image(
        package: 'shuffle_uikit',
        fit: fit ?? BoxFit.none,
      );
}
