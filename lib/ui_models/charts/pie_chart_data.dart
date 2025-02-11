import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_models/charts/ui_kit_pie_chart_legend_item.dart';
import 'package:shuffle_uikit/utils/extentions/pie_chart_extensions.dart';

import 'line_chart_small_preview_data.dart';

class UiKitPieChartData {
  final String chartName;
  final num overallValue;
  final List<UiKitPieCharItemData> items;

  const UiKitPieChartData({
    required this.chartName,
    this.overallValue = 100,
    required this.items,
  });

  bool get sumOfItemsExceedsOverallValue => items.sum > overallValue;

  List<UiKitPieChartLegendItem> get legend => items.legendItems;

  factory UiKitPieChartData.empty() {
    return UiKitPieChartData(
      chartName: '',
      overallValue: 100,
      items: [],
    );
  }
}

class UiKitPieCharItemData {
  final Color color;
  final num value;
  final String itemName;
  final String itemValueMetricsName;
  final LineChartSelectedPointDataState? state;

  const UiKitPieCharItemData({
    required this.color,
    required this.value,
    required this.itemName,
    this.itemValueMetricsName = '%',
    this.state,
  });

  factory UiKitPieCharItemData.empty() => UiKitPieCharItemData(
        color: Colors.transparent,
        value: 0,
        itemName: '',
        itemValueMetricsName: '',
        state: LineChartSelectedPointDataState.hide,
      );

  UiKitPieCharItemData copyWith({
    Color? color,
    num? value,
    String? itemName,
    String? itemValueMetricsName,
    LineChartSelectedPointDataState? state,
  }) =>
      UiKitPieCharItemData(
        color: color ?? this.color,
        value: value ?? this.value,
        itemName: itemName ?? this.itemName,
        itemValueMetricsName: itemValueMetricsName ?? this.itemValueMetricsName,
        state: state ?? this.state,
      );
}
