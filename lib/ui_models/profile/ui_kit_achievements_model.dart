
class UiKitAchievementsModel {
  final String title;
  final String? asset;
  final String? objectUrl;
  final String? animationName;

  const UiKitAchievementsModel({required this.title, this.asset, this.objectUrl, this.animationName});

  UiKitAchievementsModel copyWith({String? title, String? asset, String? objectUrl, String? animationName}) =>
      UiKitAchievementsModel(
        title: title ?? this.title,
        asset: asset ?? this.asset,
        objectUrl: objectUrl ?? this.objectUrl,
        animationName: animationName ?? this.animationName,
      );

  @override
  bool operator ==(Object other) {
    return other is UiKitAchievementsModel && (asset == other.asset || objectUrl == other.objectUrl);
  }

  @override
  int get hashCode => asset?.hashCode ?? objectUrl?.hashCode ?? title.hashCode;
}
