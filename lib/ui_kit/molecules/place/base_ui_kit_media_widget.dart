import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseUiKitMediaWidget extends StatelessWidget {
  const BaseUiKitMediaWidget({
    Key? key,
  }) : super(key: key);

  factory BaseUiKitMediaWidget.image({
    required BaseUiKitMedia media,
  }) {
    return UiKitMediaImageWidget(media: media);
  }

  factory BaseUiKitMediaWidget.video({
    required BaseUiKitMedia media,
  }) {
    return UiKitMediaVideoWidget(media: media);
  }
}
