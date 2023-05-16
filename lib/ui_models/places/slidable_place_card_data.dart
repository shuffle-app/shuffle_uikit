import 'package:shuffle_uikit/ui_models/places/base_ui_kit_media.dart';

class SlidablePlaceCardData {
  final List<BaseUiKitMedia>? media;
  final String? title;
  final List<UiKitTag>? placeTags;

  const SlidablePlaceCardData({
    this.media,
    this.title,
    this.placeTags,
  });
}
