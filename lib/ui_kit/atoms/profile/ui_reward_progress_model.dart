class UiRewardProgressModel {
  final String? title;
  final double? current;
  final double? total;

  UiRewardProgressModel({
    this.title,
    this.current,
    this.total,
  });

  UiRewardProgressModel copyWith({
    String? title,
    double? current,
    double? total,
  }) =>
      UiRewardProgressModel(
        title: title ?? this.title,
        current: current ?? this.current,
        total: total ?? this.total,
      );
}
