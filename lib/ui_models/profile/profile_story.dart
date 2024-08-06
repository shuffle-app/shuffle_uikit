class ProfileVideoReaction {
  final String image;
  final bool viewed;
  final bool isEmpty;
  final void Function()? onTap;

  const ProfileVideoReaction({
    required this.image,
    this.viewed = false,
    this.isEmpty = false,
    this.onTap,
  });
}
