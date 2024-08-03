import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';

class LineChartSmallPreviewData {
  final double leftOffset;
  final double previewWidthFraction;
  final bool atEdge;

  LineChartSmallPreviewData({
    required this.leftOffset,
    required this.previewWidthFraction,
    this.atEdge = false,
  });

  factory LineChartSmallPreviewData.initial() => LineChartSmallPreviewData(
        leftOffset: 0,
        previewWidthFraction: 0.35,
        atEdge: true,
      );

  LineChartSmallPreviewData copyWith({
    double? leftOffset,
    double? previewWidthFraction,
    bool? atEdge,
  }) {
    return LineChartSmallPreviewData(
      leftOffset: leftOffset ?? this.leftOffset,
      previewWidthFraction: previewWidthFraction ?? this.previewWidthFraction,
      atEdge: atEdge ?? this.atEdge,
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
