import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SliderPhotoCard extends StatelessWidget {
  final BaseUiKitMedia media;
  final Size givenSize;

  const SliderPhotoCard({
    super.key,
    required this.media,
    required this.givenSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: givenSize,
      child: media.type == UiKitMediaType.image ? BaseUiKitMediaWidget.image(media: media) : BaseUiKitMediaWidget.video(media: media),
    );
  }
}
