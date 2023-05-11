import 'package:shuffle_uikit/ui_models/places/place.dart';

class SlidablePlaceCardData {
  final List<BaseUiKitMedia> media;
  final String title;
  final List<UiKitTag> placeTags;

  const SlidablePlaceCardData({
    required this.media,
    required this.title,
    required this.placeTags,
  });
}
