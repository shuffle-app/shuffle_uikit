enum PlaceMediaType { image, video }

class Place {
  final List<PlaceMedia> media;
  final String description;
  final double rating;
  final List<PlaceTag> tags;

  Place({
    required this.media,
    required this.description,
    required this.rating,
    required this.tags,
  });
}

class PlaceMedia {
  final String link;
  final PlaceMediaType type;

  PlaceMedia({
    required this.link,
    required this.type,
  });
}

class PlaceTag {
  final String title;
  final String iconPath;
  final bool matching;

  PlaceTag({
    required this.title,
    required this.iconPath,
    required this.matching,
  });
}
