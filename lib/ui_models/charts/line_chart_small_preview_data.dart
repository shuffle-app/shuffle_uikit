import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';

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

class LineChartSelectedPointData {
  final DateTime date;
  final List<UiKitLineChartItemData> chartItems;
  final int selectedDataSetIndex;

  LineChartSelectedPointData({
    required this.date,
    required this.chartItems,
    required this.selectedDataSetIndex,
  });

  factory LineChartSelectedPointData.empty() => LineChartSelectedPointData(
        date: DateTime.now(),
        chartItems: [],
        selectedDataSetIndex: -1,
      );
}
