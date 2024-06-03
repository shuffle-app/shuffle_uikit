class LineChartSmallPreviewData {
  final double leftOffset;
  final double previewWidthFraction;

  LineChartSmallPreviewData({
    required this.leftOffset,
    required this.previewWidthFraction,
  });

  LineChartSmallPreviewData copyWith({
    double? leftOffset,
    double? previewWidthFraction,
  }) {
    return LineChartSmallPreviewData(
      leftOffset: leftOffset ?? this.leftOffset,
      previewWidthFraction: previewWidthFraction ?? this.previewWidthFraction,
    );
  }
}
