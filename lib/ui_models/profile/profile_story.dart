class ProfileStory {
  final String image;
  final bool viewed;
  final bool isEmpty;

  const ProfileStory({
    required this.image,
    this.viewed = false,
    this.isEmpty = false,
  });
}
