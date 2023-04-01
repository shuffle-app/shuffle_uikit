class ProfilePlace {
  final String image;
  final String title;
  final String createdAt;
  final String postBody;
  final int? stars;
  final int postReactionCount;
  final List<ProfilePlaceTag> tags;

  ProfilePlace({
    required this.image,
    required this.title,
    required this.postBody,
    required this.createdAt,
    this.stars,
    required this.postReactionCount,
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
