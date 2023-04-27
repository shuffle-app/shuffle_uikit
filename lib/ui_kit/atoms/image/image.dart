import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ImageWidget extends StatelessWidget {
  final String? link;
  final AssetGenImage? rasterAsset;
  final SvgGenImage? svgAsset;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color? color;

  const ImageWidget(
      {Key? key,
      this.link,
      this.fit,
      this.width,
      this.height,
      this.rasterAsset,
      this.svgAsset,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        fit: fit,
        height: height,
        width: width,
      );
    } else if (link == null) {
      return Placeholder(
        color: color,
        child: SizedBox(
          width: width,
          height: height,
        ),
      );
    } else if (link!.startsWith("http://") || link!.startsWith("https://")) {
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
