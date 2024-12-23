import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_models/places/base_ui_kit_media.dart';

class DigestUiModel {
  final String? title;
  final String? imageUrl;
  final List<UiKitTag>? tags;
  final String? contentDescription;
  final String? description;
  final int? rating;
  final ValueNotifier<bool>? showTranslateButton;

  final ValueNotifier<String>? contentDescriptionTranslate;
  final ValueNotifier<String>? descriptionTranslate;

  late final ValueNotifier<String>? contentDescriptionNotifier;
  late final ValueNotifier<String>? descriptionNotifier;

  DigestUiModel({
    this.title,
    this.imageUrl,
    this.tags,
    this.contentDescription,
    this.description,
    this.rating,
    this.showTranslateButton,
    this.contentDescriptionTranslate,
    this.descriptionTranslate,
  }) {
    contentDescriptionNotifier = ValueNotifier<String>(contentDescription ?? '');
    descriptionNotifier = ValueNotifier<String>(description ?? '');
  }
}
