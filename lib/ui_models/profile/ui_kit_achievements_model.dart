import 'dart:ui';

import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitAchievementsModel {
  final String title;
  final String? description;
  final String? posterUrl;
  final String? objectUrl;
  final String? animationName;
  final UiRewardProgressModel? uiRewardProgressModel;
  final VoidCallback? onLoad;
  final VoidCallback? unLoad;

  const UiKitAchievementsModel({
    required this.title,
    this.description,
    this.posterUrl,
    this.objectUrl,
    this.animationName,
    this.uiRewardProgressModel,
    this.onLoad,
    this.unLoad,
  });

  UiKitAchievementsModel copyWith({
    String? title,
    String? description,
    String? posterUrl,
    String? objectUrl,
    String? animationName,
    double? current,
    double? total,
    VoidCallback? onLoad,
    VoidCallback? unLoad,
  }) =>
      UiKitAchievementsModel(
        title: title ?? this.title,
        description: description ?? this.description,
        posterUrl: posterUrl ?? this.posterUrl,
        objectUrl: objectUrl ?? this.objectUrl,
        animationName: animationName ?? this.animationName,
        uiRewardProgressModel: uiRewardProgressModel?.copyWith(current: current, total: total),
        onLoad: onLoad ?? this.onLoad,
        unLoad: unLoad ?? this.unLoad,
      );

  @override
  bool operator ==(Object other) {
    return other is UiKitAchievementsModel && (posterUrl == other.posterUrl || objectUrl == other.objectUrl);
  }

  @override
  int get hashCode => posterUrl?.hashCode ?? objectUrl?.hashCode ?? title.hashCode;
}
