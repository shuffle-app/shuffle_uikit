import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseUiKitMediaWidget extends StatelessWidget {
  const BaseUiKitMediaWidget({
    super.key,
  });

  factory BaseUiKitMediaWidget.image({
    required BaseUiKitMedia media,
    double? width,
    PlaceWeatherType? weatherType,
  }) {
    return UiKitMediaImageWidget(media: media,width:width,weatherType: weatherType,);
  }

  factory BaseUiKitMediaWidget.video({
    required BaseUiKitMedia media,
    double? width,
  }) {
    return UiKitMediaVideoWidget(media: media,width:width);
  }
}
