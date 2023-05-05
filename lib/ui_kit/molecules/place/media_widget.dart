import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/buttons/blurred_place_video_play_button.dart';

abstract class UiKitMediaWidget extends StatelessWidget {
  const UiKitMediaWidget({
    Key? key,
  }) : super(key: key);

  factory UiKitMediaWidget.image({
    required UiKitMedia media,
  }) {
    return _UIKiMediaImageWidget(media: media);
  }

  factory UiKitMediaWidget.video({
    required UiKitMedia media,
  }) {
    return _MediaVideoWidget(media: media);
  }
}

class _UIKiMediaImageWidget extends UiKitMediaWidget {
  final UiKitMedia media;

  const _UIKiMediaImageWidget({
    Key? key,
    required this.media,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusFoundation.all24,
      child: ImageWidget(
        link: media.link,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _MediaVideoWidget extends UiKitMediaWidget {
  final UiKitMedia media;

  const _MediaVideoWidget({
    Key? key,
    required this.media,
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
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 12.h,
          left: 12.w,
          child: BlurredPlaceVideoPlayButton(
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
