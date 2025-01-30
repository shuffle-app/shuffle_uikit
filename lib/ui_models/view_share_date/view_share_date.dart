class ViewShareDate {
  final DateTime? createdAt;
  final int? viewCount;
  final int? shareCount;

  const ViewShareDate({
    this.createdAt,
    this.viewCount,
    this.shareCount,
  });

  ViewShareDate copyWith({
    DateTime? createdAt,
    int? viewCount,
    int? shareCount,
  }) =>
      ViewShareDate(
        createdAt: createdAt ?? this.createdAt,
        viewCount: viewCount ?? this.viewCount,
        shareCount: shareCount ?? this.shareCount,
      );
}
