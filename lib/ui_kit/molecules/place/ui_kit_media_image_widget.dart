import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter/foundation.dart';

class UiKitMediaImageWidget extends BaseUiKitMediaWidget {
  final BaseUiKitMedia media;
  final double? width;
  final PlaceWeatherType? weatherType;

  const UiKitMediaImageWidget({
    super.key,
    required this.media,
    this.width,
    this.weatherType,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        ClipRRect(
          borderRadius: kIsWeb
              ? BorderRadiusFoundation.all16
              : BorderRadiusFoundation.all24,
          child: ImageWidget(
            lowerQuality: true,
            link: media.link,
            width: width ?? (kIsWeb ? 300 : 0.83.sw),
            fit: BoxFit.cover,
            errorWidget: const UiKitBigPhotoErrorWidget(),
          ),
        ),
        if (weatherType != null)
          Positioned(
            top: 12.h,
            left: 12.w,
            child: UiKitPlaceWeatherAnimation(
              weatherType: weatherType!,
            ),
          ),
      ],
    );
  }
}
