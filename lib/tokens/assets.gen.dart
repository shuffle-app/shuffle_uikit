/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Syne-Bold.ttf
  String get syneBold => 'assets/fonts/Syne-Bold.ttf';

  /// File path: assets/fonts/Syne-Regular.ttf
  String get syneRegular => 'assets/fonts/Syne-Regular.ttf';

  /// File path: assets/fonts/Syne-SemiBold.ttf
  String get syneSemiBold => 'assets/fonts/Syne-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [syneBold, syneRegular, syneSemiBold];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/atmosphere.png
  AssetGenImage get atmosphere => const AssetGenImage('assets/images/png/atmosphere.png');

  /// File path: assets/images/png/event_avatar.png
  AssetGenImage get eventAvatar => const AssetGenImage('assets/images/png/event_avatar.png');

  /// File path: assets/images/png/place.png
  AssetGenImage get place => const AssetGenImage('assets/images/png/place.png');

  /// File path: assets/images/png/profile_avatar.png
  AssetGenImage get profileAvatar => const AssetGenImage('assets/images/png/profile_avatar.png');

  /// File path: assets/images/png/profile_post_1.png
  AssetGenImage get profilePost1 => const AssetGenImage('assets/images/png/profile_post_1.png');

  /// File path: assets/images/png/profile_story_1.png
  AssetGenImage get profileStory1 => const AssetGenImage('assets/images/png/profile_story_1.png');

  /// List of all assets
  List<AssetGenImage> get values => [atmosphere, eventAvatar, place, profileAvatar, profilePost1, profileStory1];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/chevron_left.svg
  SvgGenImage get chevronLeft => const SvgGenImage('assets/images/svg/chevron_left.svg');

  /// File path: assets/images/svg/chevron_right.svg
  SvgGenImage get chevronRight => const SvgGenImage('assets/images/svg/chevron_right.svg');

  /// File path: assets/images/svg/cocktail.svg
  SvgGenImage get cocktail => const SvgGenImage('assets/images/svg/cocktail.svg');

  /// File path: assets/images/svg/influencer_account_mark.svg
  SvgGenImage get influencerAccountMark => const SvgGenImage('assets/images/svg/influencer_account_mark.svg');

  /// File path: assets/images/svg/like.svg
  SvgGenImage get like => const SvgGenImage('assets/images/svg/like.svg');

  /// File path: assets/images/svg/play_arrow.svg
  SvgGenImage get playArrow => const SvgGenImage('assets/images/svg/play_arrow.svg');

  /// File path: assets/images/svg/premium_account_mark.svg
  SvgGenImage get premiumAccountMark => const SvgGenImage('assets/images/svg/premium_account_mark.svg');

  /// File path: assets/images/svg/pro_account_mark.svg
  SvgGenImage get proAccountMark => const SvgGenImage('assets/images/svg/pro_account_mark.svg');

  /// File path: assets/images/svg/star.svg
  SvgGenImage get star => const SvgGenImage('assets/images/svg/star.svg');

  /// File path: assets/images/svg/triple_arrow.svg
  SvgGenImage get tripleArrow => const SvgGenImage('assets/images/svg/triple_arrow.svg');

  /// File path: assets/images/svg/white_star.svg
  SvgGenImage get whiteStar => const SvgGenImage('assets/images/svg/white_star.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        chevronLeft,
        chevronRight,
        cocktail,
        influencerAccountMark,
        like,
        playArrow,
        premiumAccountMark,
        proAccountMark,
        star,
        tripleArrow,
        whiteStar
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated Clip clipBehavior = Clip.hardEdge,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
