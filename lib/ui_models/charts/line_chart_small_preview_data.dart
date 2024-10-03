import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';

class LineChartSmallPreviewData {
  final double leftOffset;
  final double previewWidthFraction;
  final bool atEdge;
  final List<int> visibleLinesIds;

  LineChartSmallPreviewData({
    required this.leftOffset,
    required this.previewWidthFraction,
    required this.visibleLinesIds,
    this.atEdge = false,
  });

  factory LineChartSmallPreviewData.initial() => LineChartSmallPreviewData(
        leftOffset: 0,
        previewWidthFraction: 0.35,
        atEdge: true,
        visibleLinesIds: [],
      );

  LineChartSmallPreviewData copyWith({
    double? leftOffset,
    double? previewWidthFraction,
    bool? atEdge,
    List<int>? visibleLinesIds,
  }) {
    return LineChartSmallPreviewData(
      leftOffset: leftOffset ?? this.leftOffset,
      previewWidthFraction: previewWidthFraction ?? this.previewWidthFraction,
      atEdge: atEdge ?? this.atEdge,
      visibleLinesIds: visibleLinesIds ?? this.visibleLinesIds,
    );
  }

  @override
  String toString() {
    return 'LineChartSmallPreviewData(leftOffset: $leftOffset, previewWidthFraction: $previewWidthFraction, atEdge: $atEdge, visibleLinesIds: $visibleLinesIds)';
  }
}

class LineChartSelectedPointData {
  final DateTime date;
  final List<UiKitLineChartItemData> chartItems;
  final int selectedDataSetIndex;
  final LineChartSelectedPointDataState state;

  LineChartSelectedPointData({
    required this.date,
    required this.chartItems,
    required this.selectedDataSetIndex,
    required this.state,
  });

  factory LineChartSelectedPointData.empty() => LineChartSelectedPointData(
        date: DateTime.now(),
        chartItems: [],
        selectedDataSetIndex: -1,
        state: LineChartSelectedPointDataState.hide,
      );

  LineChartSelectedPointData copyWith({
    DateTime? date,
    List<UiKitLineChartItemData>? chartItems,
    int? selectedDataSetIndex,
    LineChartSelectedPointDataState? state,
  }) {
    return LineChartSelectedPointData(
      date: date ?? this.date,
      chartItems: chartItems ?? this.chartItems,
      selectedDataSetIndex: selectedDataSetIndex ?? this.selectedDataSetIndex,
      state: state ?? this.state,
    );
  }
}

enum LineChartSelectedPointDataState { show, keepOnScreen, hide }
