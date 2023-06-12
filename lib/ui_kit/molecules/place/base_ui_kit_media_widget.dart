import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseUiKitMediaWidget extends StatelessWidget {
  const BaseUiKitMediaWidget({
    Key? key,
  }) : super(key: key);

  factory BaseUiKitMediaWidget.image({
    required BaseUiKitMedia media,
    double? width,
  }) {
    return UiKitMediaImageWidget(media: media,width:width);
  }

  factory BaseUiKitMediaWidget.video({
    required BaseUiKitMedia media,
    double? width,
  }) {
    return UiKitMediaVideoWidget(media: media,width:width);
  }
}
