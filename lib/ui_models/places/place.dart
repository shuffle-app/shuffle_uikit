enum UiKitMediaType { image, video }

class UiKitPlace {
  final List<UiKitMedia> media;
  final String description;
  final double rating;
  final List<UiKitTag> tags;

  UiKitPlace({
    required this.media,
    required this.description,
    required this.rating,
    required this.tags,
  });
}

class UiKitMedia {
  final String link;
  final UiKitMediaType type;

  UiKitMedia({
    required this.link,
    required this.type,
  });
}

class UiKitTag {
  final String title;
  final String iconPath;
  final bool matching;

  UiKitTag({
    required this.title,
    required this.iconPath,
    required this.matching,
  });
}
