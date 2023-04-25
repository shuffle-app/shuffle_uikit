import 'package:shuffle_uikit/ui_models/places/place.dart';

class SlidablePlaceCardData {
  final List<String> photos;
  final String title;
  final List<UiKitPlaceTag> placeTags;

  const SlidablePlaceCardData({
    required this.photos,
    required this.title,
    required this.placeTags,
  });
}
