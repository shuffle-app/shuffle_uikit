import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_models/places/base_ui_kit_media.dart';

class DigestUiModel {
  final int? placeId;
  final int? eventId;
  final String? title;
  final String? imageUrl;
  final List<UiKitTag>? tags;
  final String? contentDescription;
  final String? description;
  final int? rating;
  final String? subTitle;
  final List<UiKitMediaPhoto>? newPhotos;
  final List<UiKitMediaVideo>? newVideos;

  ///Transitions
  final ValueNotifier<bool>? showTranslateButton;
  final ValueNotifier<String>? contentDescriptionTranslate;
  final ValueNotifier<String>? descriptionTranslate;
  final ValueNotifier<String>? subTitleTranslate;
  late final ValueNotifier<String>? contentDescriptionNotifier;
  late final ValueNotifier<String>? descriptionNotifier;
  late final ValueNotifier<String>? subTitleNotifier;

  DigestUiModel({
    this.placeId,
    this.eventId,
    this.title,
    this.imageUrl,
    this.tags,
    this.contentDescription,
    this.description,
    this.rating,
    this.subTitle,
    this.newPhotos,
    this.newVideos,
    this.showTranslateButton,
    this.contentDescriptionTranslate,
    this.descriptionTranslate,
    this.subTitleTranslate,
  }) {
    contentDescriptionNotifier = ValueNotifier<String>(contentDescription ?? '');
    descriptionNotifier = ValueNotifier<String>(description ?? '');
    subTitleNotifier = ValueNotifier<String>(subTitle ?? '');
  }
}
