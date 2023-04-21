enum UiKitPlaceMediaType { image, video }

class UiKitPlace {
  final List<UiKitPlaceMedia> media;
  final String description;
  final double rating;
  final List<UiKitPlaceTag> tags;

  UiKitPlace({
    required this.media,
    required this.description,
    required this.rating,
    required this.tags,
  });
}

class UiKitPlaceMedia {
  final String link;
  final UiKitPlaceMediaType type;

  UiKitPlaceMedia({
    required this.link,
    required this.type,
  });
}

class UiKitPlaceTag {
  final String title;
  final String iconPath;
  final bool matching;

  UiKitPlaceTag({
    required this.title,
    required this.iconPath,
    required this.matching,
  });
}
