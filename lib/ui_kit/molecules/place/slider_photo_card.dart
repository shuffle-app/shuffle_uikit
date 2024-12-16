import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SliderPhotoCard extends StatelessWidget {
  final BaseUiKitMedia media;
  final Size givenSize;
  final PlaceWeatherType? weatherType;
  final String? heroTag;

  const SliderPhotoCard({
    super.key,
    required this.media,
    required this.givenSize,
    this.weatherType,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: givenSize,
      child: media.link == 'loading'
          ? ImageWidget.placeholder
          : (media.type == UiKitMediaType.image
              ? Hero(
                  tag: heroTag ?? '',
                  transitionOnUserGestures: true,
                  child: BaseUiKitMediaWidget.image(
                    media: media,
                    weatherType: weatherType,
                    width: givenSize.width,
                  ),
                )
              : BaseUiKitMediaWidget.video(media: media)),
    );
  }
}
