import 'dart:developer';
import 'dart:io';

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
  final Widget? errorWidget;
  final bool lowerQuality;
  final BlendMode? colorBlendMode;

  const ImageWidget({
    Key? key,
    this.link,
    this.fit,
    this.width,
    this.height,
    this.lowerQuality = true,
    this.rasterAsset,
    this.svgAsset,
    this.color,
    this.errorWidget,
    this.colorBlendMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (rasterAsset != null) {
      return rasterAsset!.image(
        color: color,
        package: 'shuffle_uikit',
        fit: fit,
        height: height,
        width: width,
        colorBlendMode: colorBlendMode,
      );
    } else if (svgAsset != null) {
      return svgAsset!.svg(
        package: 'shuffle_uikit',
        color: color,
        fit: fit ?? BoxFit.none,
        height: height,
        width: width,
      );
    } else if (link == null || link!.isEmpty) {
      return UiKitCardWrapper(
        width: width,
        height: height,
        child: errorWidget ?? const DefaultImageErrorWidget(),
      );
    } else if (link!.substring(0, 4) == 'http') {
      // !.startsWith("http://") || link!.startsWith("https://")) {
      return CachedNetworkImage(
        imageUrl: link!,
        fit: fit,
        color: color,
        width: width,
        filterQuality: lowerQuality ? FilterQuality.low : FilterQuality.high,
        height: height,
        colorBlendMode: colorBlendMode,
        cacheManager: CustomCacheManager.instance,
        errorWidget: (context, url, trace) {
          log('Got error while downloading $url', name: 'ImageWidget');

          return errorWidget ?? const DefaultImageErrorWidget();
        },
        placeholder: (_, __) => CircularProgressIndicator.adaptive(backgroundColor: color,),
      );
    } else if (link!.contains('svg')) {
      return SvgPicture.asset(
        link!,
        fit: fit ?? BoxFit.none,
        width: width,
        color: color,
        height: height,
        package: 'shuffle_uikit',
        placeholderBuilder: (context) => errorWidget ?? const DefaultImageErrorWidget(),
      );
    } else if (link!.contains('asset')) {
      return Image.asset(
        link!,
        fit: fit,
        width: width,
        color: color,
        height: height,
        colorBlendMode: colorBlendMode,
        package: 'shuffle_uikit',
        errorBuilder: (context, error, trace) => errorWidget ?? const DefaultImageErrorWidget(),
      );
    } else {
      return Image.file(
        File(link!),
        fit: fit,
        width: width,
        color: color,
        height: height,
        errorBuilder: (context, error, trace) => errorWidget ?? const DefaultImageErrorWidget(),
      );
    }
  }
}
