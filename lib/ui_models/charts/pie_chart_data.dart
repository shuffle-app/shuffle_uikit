import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_models/charts/ui_kit_pie_chart_legend_item.dart';
import 'package:shuffle_uikit/utils/extentions/pie_chart_extensions.dart';

class UiKitPieChartData {
  final String chartName;
  final num overallValue;
  final List<UiKitPieCharItemData> items;

  UiKitPieChartData({
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

  UiKitPieCharItemData({
    required this.color,
    required this.value,
    required this.itemName,
    this.itemValueMetricsName = '%',
  });
}
