class Profile {
  final String nickname;
  final String description;
  final String avatarUrl;
  final int followers;
  final List<String> interests;

  Profile({
    required this.nickname,
    required this.description,
    required this.avatarUrl,
    required this.interests,
    required this.followers,
  });
}
