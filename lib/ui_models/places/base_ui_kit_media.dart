import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseUiKitMedia {
  final String link;
  final String? videoLink;
  final UiKitMediaType type;

  BaseUiKitMedia({
    required this.link,
    required this.type,
    this.videoLink,
  });

  ImageWidget widget(Size size) => ImageWidget(link: link, height: size.height, width: size.width, fit: BoxFit.cover);
}

class UiKitMediaPhoto extends BaseUiKitMedia {
  UiKitMediaPhoto({
    required String link,
  }) : super(
          link: link,
          type: UiKitMediaType.image,
        );
}

class UiKitMediaVideo extends BaseUiKitMedia {
  UiKitMediaVideo({
    required String link,
    String? videoLink,
  }) : super(
          link: link,
          videoLink: videoLink ?? link,
          type: UiKitMediaType.video,
        );
}

class UiKitTag {
  final int? id;
  final String title;
  final dynamic icon;
  final bool unique;

  UiKitTagWidget get widget => UiKitTagWidget(
        title: title,
        icon: icon,
        uniqueTag: unique,
        textColor: ColorsFoundation.darkNeutral500,
        tagSize: icon is String ? SpacingFoundation.horizontalSpacing20 : SpacingFoundation.horizontalSpacing16,
      );

  UiKitTag({
    required String title,
    required this.icon,
    this.unique = false,
    this.id,
    bool updateTitle = true,
  }) : title = updateTitle ? title.replaceAll('-', ' ') : title;
}

enum UiKitMediaType { image, video }
