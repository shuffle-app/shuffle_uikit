import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseUiKitMedia {
  final String link;
  final String? videoLink;
  final UiKitMediaType type;
  UiKitPreviewType? previewType;

  BaseUiKitMedia({
    required this.link,
    required this.type,
    this.videoLink,
    this.previewType,
  });

  ImageWidget widget(Size size) => ImageWidget(link: link, height: size.height, width: size.width, fit: BoxFit.cover);

  @override
  bool operator ==(Object other) {
    return other is BaseUiKitMedia && other.link == link && other.type == type && other.previewType == previewType;
  }

  @override
  int get hashCode => link.hashCode ^ type.hashCode ^ (previewType?.hashCode?? 1);
}

class UiKitMediaPhoto extends BaseUiKitMedia {
  UiKitMediaPhoto({required super.link, super.previewType})
      : super(
          type: UiKitMediaType.image,
        );
}

class UiKitMediaVideo extends BaseUiKitMedia {
  UiKitMediaVideo({
    required super.link,
    String? videoLink,
  }) : super(
          videoLink: videoLink ?? link,
          type: UiKitMediaType.video,
        );
}

class UiKitTag {
  final int? id;
  final String title;
  final dynamic icon;
  final bool unique;
  final Color? iconColor;
  final Color? textColor;
  final bool showShadow;

  UiKitTagWidget get widget => UiKitTagWidget(
        iconCustomColor: iconColor,
        title: title,
        icon: icon,
        showShadow: showShadow,
        uniqueTag: unique,
        textColor: textColor ?? ColorsFoundation.darkNeutral500,
        tagSize: icon is String ? SpacingFoundation.horizontalSpacing20 : SpacingFoundation.horizontalSpacing16,
      );

  UiKitTag({
    required String title,
    required this.icon,
    this.unique = false,
    this.showShadow = false,
    this.id,
    this.iconColor,
    this.textColor,
    bool updateTitle = true,
  }) : title = updateTitle ? title.replaceAll('-', ' ') : title;

  UiKitTag copyWith({
    String? title,
    dynamic icon,
    int? id,
    bool? unique,
    bool? showShadow,
    Color? iconColor,
    Color? textColor,
  }) =>
      UiKitTag(
        title: title ?? this.title,
        icon: icon ?? this.icon,
        unique: unique ?? this.unique,
        showShadow: showShadow ?? this.showShadow,
        id: id ?? this.id,
        iconColor: iconColor ?? this.iconColor,
        textColor: textColor ?? this.textColor,
      );

  @override
  bool operator ==(Object other) {
    return other is UiKitTag && other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}

enum UiKitMediaType { image, video }

enum UiKitPreviewType { horizontal, vertical }
