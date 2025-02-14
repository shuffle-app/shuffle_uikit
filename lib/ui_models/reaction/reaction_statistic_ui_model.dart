class ReactionStatisticUiModel {
  final int? viewCount;
  final int? likeCount;

  const ReactionStatisticUiModel({
    this.viewCount,
    this.likeCount,
  });

  ReactionStatisticUiModel copyWith({
    int? viewCount,
    int? likeCount,
  }) {
    return ReactionStatisticUiModel(
      viewCount: viewCount ?? this.viewCount,
      likeCount: likeCount ?? this.likeCount,
    );
  }
}
