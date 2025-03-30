import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseUiKitMedia {
  final int? id;
  final String link;
  final String? previewLink;
  final UiKitMediaType type;
  UiKitPreviewType? previewType;

  BaseUiKitMedia({
    this.id,
    required this.link,
    required this.type,
    this.previewLink,
    this.previewType,
  });

  ImageWidget widget(Size size) => ImageWidget(
        link: previewLink ?? link,
        height: size.height,
        width: size.width,
        fit: BoxFit.cover,
        isVideo: type == UiKitMediaType.video && previewLink == null,
      );

  @override
  bool operator ==(Object other) {
    return other is BaseUiKitMedia && other.link == link && other.type == type && other.previewType == previewType;
  }

  @override
  int get hashCode => link.hashCode ^ type.hashCode ^ (previewType?.hashCode ?? 1);

  @override
  String toString() => 'BaseUiKitMedia{link: $link, type: $type, previewType: $previewType}';

  Map<String, dynamic> toMap() => {
        'id': id,
        'link': link,
        'previewLink': previewLink,
        'type': type.name,
        'previewType': previewType?.name,
      }..removeWhere((k, v) => v == null);

  static BaseUiKitMedia fromMap(Map<String, dynamic> map) {
    final type = UiKitMediaType.values.firstWhere((type) => type.name == map['type']);
    switch (type) {
      case UiKitMediaType.image:
        return UiKitMediaPhoto(
          id: map['id'],
          link: map['link'],
          previewType: UiKitPreviewType.values.firstWhereOrNull((type) => type.name == map['previewType']),
        );
      case UiKitMediaType.video:
        return UiKitMediaVideo(
          id: map['id'],
          link: map['link'],
          previewType: UiKitPreviewType.values.firstWhereOrNull((type) => type.name == map['previewType']),
          previewLink: map['previewLink'],
        );
    }
  }
}

class UiKitMediaPhoto extends BaseUiKitMedia {
  UiKitMediaPhoto({
    required super.link,
    super.previewType,
    super.id,
  }) : super(
          type: UiKitMediaType.image,
        );
}

class UiKitMediaVideo extends BaseUiKitMedia {
  UiKitMediaVideo({
    super.id,
    required super.link,
    super.previewType,
    super.previewLink,
  }) : super(
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
  final bool colorIsNull;

  UiKitTagWidget get widget => UiKitTagWidget(
        iconCustomColor: iconColor,
        title: title,
        icon: icon,
        showShadow: showShadow,
        uniqueTag: unique,
        textColor: textColor ?? ColorsFoundation.darkNeutral500,
        tagSize: icon is String ? SpacingFoundation.horizontalSpacing20 : SpacingFoundation.horizontalSpacing16,
        colorIsNull: colorIsNull,
      );

  UiKitTag({
    required String title,
    required this.icon,
    this.unique = false,
    this.showShadow = false,
    this.id,
    this.iconColor,
    this.textColor,
    this.colorIsNull = false,
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
    bool? colorIsNull,
  }) =>
      UiKitTag(
        title: title ?? this.title,
        icon: icon ?? this.icon,
        unique: unique ?? this.unique,
        showShadow: showShadow ?? this.showShadow,
        id: id ?? this.id,
        iconColor: iconColor ?? this.iconColor,
        textColor: textColor ?? this.textColor,
        colorIsNull: colorIsNull ?? this.colorIsNull,
      );

  @override
  bool operator ==(Object other) {
    return other is UiKitTag && (other.id != null && id != null ? other.id == id : other.title == title);
  }

  @override
  int get hashCode => id?.hashCode ?? title.hashCode;

  Map<String, dynamic> toMap() => {
        'title': title,
        'icon': icon is String ? icon : null,
        'unique': unique,
        'showShadow': showShadow,
        'id': id,
        'iconColor': iconColor,
        'textColor': textColor,
        'colorIsNull': colorIsNull,
        'updateTitle': false,
      }..removeWhere((k, v) => v == null);

  static UiKitTag fromMap(Map<String, dynamic> map) => UiKitTag(
        title: map['title'],
        icon: map['icon'],
        unique: map['unique'],
        showShadow: map['showShadow'],
        id: map['id'],
        iconColor: map['iconColor'],
        textColor: map['textColor'],
        colorIsNull: map['colorIsNull'],
        updateTitle: map['updateTitle'] ?? false,
      );
}

enum UiKitMediaType { image, video }

enum UiKitPreviewType { horizontal, vertical }
