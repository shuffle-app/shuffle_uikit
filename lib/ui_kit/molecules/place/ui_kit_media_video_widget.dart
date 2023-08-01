import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMediaVideoWidget extends BaseUiKitMediaWidget {
  final BaseUiKitMedia media;
  final double? width;

  const UiKitMediaVideoWidget({
    Key? key,
    required this.media,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusFoundation.all24,
          child: ImageWidget(
            link: media.link,
            width: width ?? 0.83.sw,
            fit: BoxFit.cover,
            errorWidget: const UiKitBigPhotoErrorWidget(),
          ),
        ),
        Positioned(
          top: 12.h,
          left: 12.w,
          child: BlurredPlaceVideoPlayButton(
            onPressed: () => Navigator.of(context, rootNavigator: true)
                .push(PopUpVideoPlayer(videoUri: media.videoLink!)),
          ),
        ),
      ],
    );
  }
}
