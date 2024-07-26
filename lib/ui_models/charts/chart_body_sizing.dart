class UiKitBodySizingInfo {
  final double additionalWidth;

  const UiKitBodySizingInfo({required this.additionalWidth});

  UiKitBodySizingInfo copyWith({
    double? additionalWidth,
  }) {
    return UiKitBodySizingInfo(
      additionalWidth: additionalWidth ?? this.additionalWidth,
    );
  }

  factory UiKitBodySizingInfo.initial() {
    return const UiKitBodySizingInfo(
      additionalWidth: 0,
    );
  }
}
