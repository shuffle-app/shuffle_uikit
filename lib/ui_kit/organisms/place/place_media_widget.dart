import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/ui_kit/atoms/buttons/blurred_place_video_play_button.dart';
import 'package:shuffle_uikit/ui_models/places/place.dart';

abstract class PlaceMediaWidget extends StatelessWidget {
  const PlaceMediaWidget({
    Key? key,
  }) : super(key: key);

  factory PlaceMediaWidget.image({
    required PlaceMedia media,
  }) {
    return _PlaceMediaImageWidget(media: media);
  }

  factory PlaceMediaWidget.video({
    required PlaceMedia media,
  }) {
    return _PlaceMediaVideoWidget(media: media);
  }
}

class _PlaceMediaImageWidget extends PlaceMediaWidget {
  final PlaceMedia media;

  const _PlaceMediaImageWidget({
    Key? key,
    required this.media,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      media.link,
      fit: BoxFit.cover,
      package: 'shuffle_uikit',
    );
  }
}

class _PlaceMediaVideoWidget extends PlaceMediaWidget {
  final PlaceMedia media;

  const _PlaceMediaVideoWidget({
    Key? key,
    required this.media,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Image.asset(
          media.link,
          fit: BoxFit.cover,
          package: 'shuffle_uikit',
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
