import 'package:shuffle_uikit/shuffle_uikit.dart';

class SlidablePlaceCardData {
  final List<BaseUiKitMedia>? media;
  final String? title;
  final PlaceWeatherType? weatherType;
  final List<UiKitTag>? placeTags;

  const SlidablePlaceCardData({
    this.media,
    this.title,
    this.placeTags,
    this.weatherType,
  });
}
