import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ImageWidget extends StatelessWidget {
  final String? link;
  final AssetGenImage? rasterAsset;
  final SvgGenImage? svgAsset;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color? color;

  const ImageWidget({Key? key, this.link, this.fit, this.width, this.height, this.rasterAsset, this.svgAsset, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(
    //     'here is build ImageWidget with link $link and results link!.startsWith("http://") || link!.startsWith("https://") ${link?.startsWith("http://")} || ${link?.startsWith("https://")}');

    if (rasterAsset != null) {
      return rasterAsset!.image(
        color: color,
        package: 'shuffle_uikit',
        fit: fit,
        height: height,
        width: width,
      );
    }
    if (svgAsset != null) {
      return svgAsset!.svg(
        package: 'shuffle_uikit',
        color: color,
        fit: fit ?? BoxFit.none,
        height: height,
        width: width,
      );
    } else if (link == null || link!.isEmpty) {
      return Placeholder(
        color: color ?? context.uiKitTheme?.cardColor ?? Colors.white,
        child: SizedBox(
          width: width,
          height: height,
        ),
      );
    } else if (link!.substring(0, 4) == 'http') {
      // !.startsWith("http://") || link!.startsWith("https://")) {
      return CachedNetworkImage(
        imageUrl: link!,
        fit: fit,
        color: color,
        width: width,
        height: height,
        cacheManager: CustomCacheManager.instance,
        placeholder: (_, __) => const CircularProgressIndicator.adaptive(),
      );
    } else {
      if (link!.contains('svg')) {
        return SvgPicture.asset(
          link!,
          fit: fit ?? BoxFit.none,
          width: width,
          color: color,
          height: height,
          package: 'shuffle_uikit',
        );
      }

      return Image.asset(
        link!,
        fit: fit,
        width: width,
        color: color,
        height: height,
        package: 'shuffle_uikit',
      );
    }
  }
}
