enum UiKitMediaType { image, video }

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
