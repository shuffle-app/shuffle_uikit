import 'package:flutter/material.dart';

class UiKitMiniChartData {
  final String title;
  final List<UiKitMiniChartDataItem> items;
  final num value;
  final num? progress;
  final String? valueMetricsName;
  final Color color;

  UiKitMiniChartData({
    required this.title,
    required this.items,
    this.progress,
    required this.value,
    required this.color,
    this.valueMetricsName,
  });

  factory UiKitMiniChartData.empty() {
    return UiKitMiniChartData(
      title: '',
      items: [],
      progress: 0,
      value: 0,
      color: Colors.transparent,
    );
  }
}

class UiKitMiniChartDataItem {
  final DateTime time;
  final num value;

  UiKitMiniChartDataItem({
    required this.time,
    required this.value,
  });
}
