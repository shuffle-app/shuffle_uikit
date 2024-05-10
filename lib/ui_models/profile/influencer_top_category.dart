import 'package:shuffle_uikit/shuffle_uikit.dart';

class InfluencerTopCategory {
  final String title;
  final String iconPath;
  final List<InfluencerTopContentData> items;

  InfluencerTopCategory({
    required this.title,
    required this.iconPath,
    required this.items,
  });
}

class InfluencerTopContentData {
  final String title;
  final String imageUrl;
  final DateTime datePosted;
  final List<UiKitTag> tags;

  InfluencerTopContentData({
    required this.title,
    required this.imageUrl,
    required this.datePosted,
    required this.tags,
  });
}
