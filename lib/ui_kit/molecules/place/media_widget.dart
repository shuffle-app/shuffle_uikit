import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';
import 'package:shuffle_uikit/ui_kit/atoms/buttons/blurred_place_video_play_button.dart';
import 'package:shuffle_uikit/ui_models/places/place.dart';

abstract class MediaWidget extends StatelessWidget {
  const MediaWidget({
    Key? key,
  }) : super(key: key);

  factory MediaWidget.image({
    required UiKitMedia media,
  }) {
    return _MediaImageWidget(media: media);
  }

  factory MediaWidget.video({
    required UiKitMedia media,
  }) {
    return _MediaVideoWidget(media: media);
  }
}

class _MediaImageWidget extends MediaWidget {
  final UiKitMedia media;

  const _MediaImageWidget({
    Key? key,
    required this.media,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusFoundation.all24,
      child: Image.asset(
        media.link,
        fit: BoxFit.cover,
        package: 'shuffle_uikit',
      ),
    );
  }
}

class _MediaVideoWidget extends MediaWidget {
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
          child: Image.asset(
            media.link,
            fit: BoxFit.cover,
            package: 'shuffle_uikit',
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
