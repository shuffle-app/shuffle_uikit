import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMediaVideoWidget extends BaseUiKitMediaWidget {
  final BaseUiKitMedia media;
  final double? width;
  final BorderRadius? borderRadius;
  final Offset? playButtonCustomOffset;

  const UiKitMediaVideoWidget({
    super.key,
    required this.media,
    this.width,
    this.borderRadius,
    this.playButtonCustomOffset,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        ClipRRect(
          borderRadius: borderRadius ?? BorderRadiusFoundation.all24,
          child: ImageWidget(
            link: media.previewLink ?? media.link,
            isVideo: media.previewLink != null ? false : true,
            width: width ?? (kIsWeb ? 300 : 0.83.sw),
            fit: BoxFit.cover,
            errorWidget: const UiKitBigPhotoErrorWidget(),
          ),
        ),
        Positioned(
          top: playButtonCustomOffset?.dy ?? 12.h,
          left: playButtonCustomOffset?.dx ?? 12.w,
          child: BlurredPlaceVideoPlayButton(
            onPressed: () =>
                Navigator.of(context, rootNavigator: true).push(PopUpVideoPlayer(videoUri: media.link!)),
          ),
        ),
      ],
    );
  }
}
