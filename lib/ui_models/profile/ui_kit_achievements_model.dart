import 'package:shuffle_uikit/ui_kit/atoms/profile/ui_reward_progress_model.dart';

class UiKitAchievementsModel {
  final String title;
  final String? posterUrl;
  final String? objectUrl;
  final String? animationName;
  final UiRewardProgressModel? uiRewardProgressModel;

  const UiKitAchievementsModel({
    required this.title,
    this.posterUrl,
    this.objectUrl,
    this.animationName,
    this.uiRewardProgressModel,
  });

  UiKitAchievementsModel copyWith({
    String? title,
    String? posterUrl,
    String? objectUrl,
    String? animationName,
    double? current,
    double? total,
  }) =>
      UiKitAchievementsModel(
        title: title ?? this.title,
        posterUrl: posterUrl ?? this.posterUrl,
        objectUrl: objectUrl ?? this.objectUrl,
        animationName: animationName ?? this.animationName,
      );

  @override
  bool operator ==(Object other) {
    return other is UiKitAchievementsModel && (posterUrl == other.posterUrl || objectUrl == other.objectUrl);
  }

  @override
  int get hashCode => posterUrl?.hashCode ?? objectUrl?.hashCode ?? title.hashCode;
}
