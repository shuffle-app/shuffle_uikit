import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMediaImageWidget extends BaseUiKitMediaWidget {
  final BaseUiKitMedia media;

  const UiKitMediaImageWidget({
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
