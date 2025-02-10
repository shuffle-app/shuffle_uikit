import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfilePlace {
  final int? placeId;
  final int? eventId;
  final String image;
  final String title;
  final DateTime createdAt;
  final String postBody;
  final double? stars;
  final int? heartEyeCount;
  final int? thumbsUpCount;
  final int? fireCount;
  final int? sunglassesCount;
  final int? smileyCount;
  final List<UiKitTag> tags;

  ProfilePlace({
    this.placeId,
    this.eventId,
    required this.image,
    required this.title,
    required this.postBody,
    required this.createdAt,
    this.stars,
    this.heartEyeCount,
    this.thumbsUpCount,
    this.fireCount,
    this.sunglassesCount,
    this.smileyCount,
    required this.tags,
  });
}

class ProfilePlaceTag {
  final String icon;
  final String title;

  ProfilePlaceTag({
    required this.icon,
    required this.title,
  });
}
