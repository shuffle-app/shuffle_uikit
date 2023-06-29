import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfilePlace {
  final String image;
  final String title;
  final DateTime createdAt;
  final String postBody;
  final double? stars;
  final int helpfulCount;
  final List<UiKitTag> tags;

  ProfilePlace({
    required this.image,
    required this.title,
    required this.postBody,
    required this.createdAt,
    this.stars,
    required this.helpfulCount,
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
