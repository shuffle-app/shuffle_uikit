import 'dart:developer';
import 'dart:io';
import 'package:flutter_video_thumbnail_plus/flutter_video_thumbnail_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

import '../../../utils/icon_matcher/icon_matcher.dart';

class ImageWidget extends StatelessWidget {
  static final placeholder = Shimmer.fromColors(
    direction: ShimmerDirection.ltr,
    baseColor: Colors.white,
    period: const Duration(milliseconds: 1000),
    highlightColor: ColorsFoundation.gradientGreyLight3,
    child: const UiKitBigPhotoErrorWidget.withoutText(),
  );

  Widget get borderedPlaceholder => borderRadius == null
      ? placeholder
      : Shimmer.fromColors(
          direction: ShimmerDirection.ltr,
          baseColor: Colors.white,
          period: const Duration(milliseconds: 1000),
          highlightColor: ColorsFoundation.gradientGreyLight3,
          child: UiKitBigPhotoErrorWidget.withoutText(
            borderRadius: borderRadius,
          ),
        );

  final String? link;
  final AssetGenImage? rasterAsset;
  final SvgGenImage? svgAsset;
  final IconData? iconData;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color? color;
  final Color? cardColor;
  final Widget? errorWidget;
  final bool lowerQuality;
  final bool isVideo;
  final BlendMode? colorBlendMode;
  final bool mentionPackage;
  final ImageFrameBuilder? imageBuilder;
  final VoidCallback? onImageLoadingFailed;
  final Uint8List? imageBytes;
  final BorderRadius? borderRadius;

  const ImageWidget({
    super.key,
    this.link,
    this.fit,
    this.width,
    this.height,
    this.mentionPackage = true,
    this.lowerQuality = false,
    this.isVideo = false,
    this.rasterAsset,
    this.svgAsset,
    this.iconData,
    this.color,
    this.cardColor,
    this.errorWidget,
    this.colorBlendMode,
    this.imageBuilder,
    this.imageBytes,
    this.onImageLoadingFailed,
    this.borderRadius,
  });

  Future _fetchVideoThumbnail(String link) async {
    late final Future thumbnailData;
    if (link.startsWith('http') || kIsWeb) {
      thumbnailData = FlutterVideoThumbnailPlus.thumbnailData(video: link);
    } else {
      thumbnailData = FlutterVideoThumbnailPlus.thumbnailFile(video: link);
    }
    //could be string or bytedata
    return await thumbnailData;
  }

  @override
  Widget build(BuildContext context) {
    if (imageBytes != null) {
      return Image.memory(
        imageBytes!,
        fit: fit,
        width: width,
        color: color,
        height: height,
        frameBuilder: imageBuilder,
        errorBuilder: (context, error, trace) => errorWidget ?? const DefaultImageErrorWidget(),
      );
    }

    if (iconData != null) {
      return Icon(
        iconData,
        color: color,
        size: height ?? width,
        opticalSize: height ?? width,
        grade: 25,
      );
    } else if (rasterAsset != null) {
      return rasterAsset!.image(
        frameBuilder: imageBuilder,
        color: color,
        package: mentionPackage ? 'shuffle_uikit' : null,
        fit: fit,
        height: height,
        width: width,
        colorBlendMode: colorBlendMode,
        errorBuilder: (context, error, trace) => errorWidget ?? const DefaultImageErrorWidget(),
      );
    } else if (svgAsset != null) {
      return svgAsset!.svg(
        package: mentionPackage ? 'shuffle_uikit' : null,
        colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
        fit: fit ?? BoxFit.none,
        height: height,
        width: width,
      );
    } else if (link == null || link!.isEmpty) {
      return cardColor == Colors.transparent
          ? SizedBox(width: width, height: height, child: errorWidget ?? const DefaultImageErrorWidget())
          : UiKitCardWrapper(
              width: width,
              color: cardColor,
              height: height,
              child: errorWidget ?? const DefaultImageErrorWidget(),
            );
    } else if (link!.split('.').lastOrNull == 'mp4' || isVideo) {
      return FutureBuilder(
        future: _fetchVideoThumbnail(link!),
        builder: (context, snapshot) {
          if (snapshot.data is String) {
            return Image.file(
              File(snapshot.data!),
              fit: fit,
              width: width,
              color: color,
              height: height,
              frameBuilder: imageBuilder,
              errorBuilder: (context, error, trace) {
                onImageLoadingFailed?.call();
                return errorWidget ?? const DefaultImageErrorWidget();
              },
            );
          } else if (snapshot.data is Uint8List) {
            return Image.memory(
              snapshot.data!,
              fit: fit,
              width: width,
              color: color,
              height: height,
              frameBuilder: imageBuilder,
              errorBuilder: (context, error, trace) {
                onImageLoadingFailed?.call();
                return errorWidget ?? const DefaultImageErrorWidget();
              },
            );
          } else {
            return borderedPlaceholder;
          }
        },
      );
    } else if (link!.length > 4 && link!.substring(0, 4) == 'http') {
      if (link!.split('.').lastOrNull == 'svg' || link!.contains('svg-icons')) {
        if (link!.split('.').lastOrNull == 'svg' && IconMatcher.matchSvgToIcon(link!) != null) {
          return Transform.scale(
              scale: 0.8,
              child: Icon(
                IconMatcher.matchSvgToIcon(link!)!,
                color: color,
                size: height ?? width,
                opticalSize: height ?? width,
                grade: 25,
              ));
        }

        return kIsWeb
            ? SvgPicture.network(
                CustomProxyStatic.proxy + link!,
                colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
                fit: fit ?? BoxFit.none,
                height: height,
                width: width,
                placeholderBuilder: (_) => ConstrainedBox(
                  constraints: BoxConstraints.loose(Size(height ?? 20.w, width ?? 20.w)),
                  child: borderedPlaceholder,
                ),
              )
            : _CustomCachedSvgPicture(
                color: color,
                width: width,
                height: height,
                placeholder: ConstrainedBox(
                  constraints: BoxConstraints.loose(Size(height ?? 20.w, width ?? 20.w)),
                  child: borderedPlaceholder,
                ),
                link: link!,
                fit: fit,
              );
      }

      // !.startsWith("http://") || link!.startsWith("https://")) {
      return CachedNetworkImage(
        imageUrl: CustomProxyStatic.proxy + link! + (width != null ? '?width=${width! * 2}' : '?width=${0.7.sw * 2}'),
        fit: fit,
        fadeInDuration: const Duration(milliseconds: 200),
        fadeOutDuration: const Duration(milliseconds: 200),
        color: color,
        width: width,
        filterQuality: lowerQuality ? FilterQuality.low : FilterQuality.high,
        height: height,
        colorBlendMode: colorBlendMode,
        cacheManager: CustomCacheManager.imageInstance,
        cacheKey: link,
        imageBuilder: (context, image) {
          final imageWidget = Image(image: image, fit: fit, width: width, height: height);

          return imageBuilder?.call(context, imageWidget, 1, false) ?? imageWidget;
        },
        // errorListener: (error) {
        //   onImageLoadingFailed?.call();
        // },
        errorWidget: (context, url, trace) {
          log('Got error while downloading $url', name: 'ImageWidget');
          log(trace.toString(), name: 'ImageWidget');

          return errorWidget ?? const DefaultImageErrorWidget();
        },
        placeholder: (_, __) => borderedPlaceholder,
      );
    } else if (link!.contains('svg')) {
      return SvgPicture.asset(
        link!,
        fit: fit ?? BoxFit.none,
        width: width,
        colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
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
        filterQuality: FilterQuality.medium,
        frameBuilder: imageBuilder,
        errorBuilder: (context, error, trace) {
          onImageLoadingFailed?.call();
          return errorWidget ?? const DefaultImageErrorWidget();
        },
      );
    } else {
      return kIsWeb
          ? Image.network(
              link!.startsWith('blob') ? link! : CustomProxyStatic.proxy + link!,
              fit: fit,
              width: width,
              color: color,
              height: height,
              errorBuilder: (context, error, trace) {
                return SvgPicture.network(
                  link!.startsWith('blob') ? link! : CustomProxyStatic.proxy + link!,
                  fit: fit ?? BoxFit.none,
                  width: width,
                  colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
                  height: height,
                  placeholderBuilder: (context) {
                    onImageLoadingFailed?.call();
                    return errorWidget ?? const DefaultImageErrorWidget();
                  },
                );
              },
              frameBuilder: imageBuilder,
            )
          : Image.file(
              File(link!),
              fit: fit,
              width: width,
              color: color,
              height: height,
              frameBuilder: imageBuilder,
              errorBuilder: (context, error, trace) {
                onImageLoadingFailed?.call();
                return errorWidget ?? const DefaultImageErrorWidget();
              },
            );
    }
  }
}

class CustomProxyStatic {
  static String? _proxyBase;

  static String get proxy {
    return _proxyBase == null || _proxyBase!.isEmpty ? '' : 'https://$_proxyBase/image-proxy/';
  }

  static set proxy(String value) {
    _proxyBase = value;
  }
}

class _CustomCachedSvgPicture extends StatefulWidget {
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color? color;
  final String link;
  final Widget placeholder;

  const _CustomCachedSvgPicture(
      {this.fit, this.width, this.height, this.color, required this.link, required this.placeholder});

  @override
  State<_CustomCachedSvgPicture> createState() => _CustomCachedSvgPictureState();
}

class _CustomCachedSvgPictureState extends State<_CustomCachedSvgPicture> {
  dynamic cachedFile;
  String _cachedLink = '';

  @override
  void initState() {
    _cachedLink = widget.link;
    CustomCacheManager.svgInstance.getSingleFile(widget.link).then((value) {
      if (mounted) {
        setState(() {
          cachedFile = value;
        });
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _CustomCachedSvgPicture oldWidget) {
    if (_cachedLink != widget.link) {
      _cachedLink = widget.link;
      CustomCacheManager.svgInstance.getSingleFile(widget.link).then((value) {
        if (mounted) {
          setState(() {
            cachedFile = value;
          });
        }
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      child: cachedFile != null
          ? SvgPicture.file(
              cachedFile!,
              colorFilter: widget.color == null ? null : ColorFilter.mode(widget.color!, BlendMode.srcIn),
              fit: widget.fit ?? BoxFit.none,
              height: widget.height,
              width: widget.width,
            )
          : Transform.scale(
              scale: 0.8,
              child: Icon(
                ShuffleUiKitIcons.shuffleDefault,
                color: widget.color,
                size: widget.height ?? widget.width,
                opticalSize: widget.height ?? widget.width,
                grade: 25,
              ),
            ),
    );
  }
}
