class AreaSelectorData {
  final double leftOffset;
  final double previewWidthFraction;

  AreaSelectorData({
    required this.leftOffset,
    required this.previewWidthFraction,
  });

  AreaSelectorData copyWith({
    double? leftOffset,
    double? previewWidthFraction,
  }) {
    return AreaSelectorData(
      leftOffset: leftOffset ?? this.leftOffset,
      previewWidthFraction: previewWidthFraction ?? this.previewWidthFraction,
    );
  }
}
