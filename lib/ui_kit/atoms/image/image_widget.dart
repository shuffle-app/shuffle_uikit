import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:video_player/video_player.dart';

class ImageWidget extends StatelessWidget {
  static const placeholder = Shimmer(gradient: GradientFoundation.greyGradient, child: UiKitBigPhotoErrorWidget());

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
  final bool mentionPackage;

  const ImageWidget({
    Key? key,
    this.link,
    this.fit,
    this.width,
    this.height,
    this.mentionPackage = true,
    this.lowerQuality = false,
    this.rasterAsset,
    this.svgAsset,
    this.color,
    this.errorWidget,
    this.colorBlendMode,
  }) : super(key: key);

  Future _takeFrameFromVideo(String link) async {
    final VideoPlayerController controller = VideoPlayerController.networkUrl(Uri.parse(link));
    await controller.initialize();
    await controller.seekTo(const Duration(seconds: 1));

    return controller;
  }

  @override
  Widget build(BuildContext context) {
    if (rasterAsset != null) {
      return rasterAsset!.image(
        color: color,
        package: mentionPackage ? 'shuffle_uikit' : null,
        fit: fit,
        height: height,
        width: width,
        colorBlendMode: colorBlendMode,
      );
    } else if (svgAsset != null) {
      return svgAsset!.svg(
        package: mentionPackage ? 'shuffle_uikit' : null,
        colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
        // color: color,
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
    } else if (link!.length > 4 && link!.substring(0, 4) == 'http') {
      if (link!.split('.').lastOrNull == 'mp4') {
        FutureBuilder(
            future: _takeFrameFromVideo(link!),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.done
                  ? VideoPlayer(snapshot.data as VideoPlayerController)
                  : placeholder;
            });
      }

      // !.startsWith("http://") || link!.startsWith("https://")) {
      return CachedNetworkImage(
        imageUrl: link!,
        fit: fit,
        fadeInDuration: const Duration(milliseconds: 200),
        fadeOutDuration: const Duration(milliseconds: 200),
        color: color,
        width: width,
        filterQuality: lowerQuality ? FilterQuality.low : FilterQuality.high,
        height: height,
        colorBlendMode: colorBlendMode,
        cacheManager: CustomCacheManager.imageInstance,
        errorWidget: (context, url, trace) {
          log('Got error while downloading $url', name: 'ImageWidget');

          return errorWidget ?? const DefaultImageErrorWidget();
        },
        placeholder: (_, __) => placeholder,
      );
    } else if (link!.contains('svg')) {
      return SvgPicture.asset(
        link!,
        fit: fit ?? BoxFit.none,
        width: width,
        colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
        // color: color,
        height: height,
        package: mentionPackage ? 'shuffle_uikit' : null,
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
        package: mentionPackage ? 'shuffle_uikit' : null,
        errorBuilder: (context, error, trace) => errorWidget ?? const DefaultImageErrorWidget(),
      );
    } else {
      return kIsWeb
          ? Image.network(
              link!,
              fit: fit,
              width: width,
              color: color,
              height: height,
              errorBuilder: (context, error, trace) => errorWidget ?? const DefaultImageErrorWidget(),
            )
          : Image.file(
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
