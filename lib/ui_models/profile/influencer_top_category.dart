import 'package:shuffle_uikit/shuffle_uikit.dart';

class InfluencerTopCategory {
  final String title;
  final String? iconPath;
  final List<InfluencerTopContentData> items;

  InfluencerTopCategory({
    required this.title,
    this.iconPath,
    required this.items,
  });
}

class InfluencerTopContentData {
  final int? placeId;
  final int? eventId;
  final String title;
  final String imageUrl;
  final DateTime datePosted;
  final List<UiKitTag> tags;

  InfluencerTopContentData({
    this.placeId,
    this.eventId,
    required this.title,
    required this.imageUrl,
    required this.datePosted,
    required this.tags,
  });
}
