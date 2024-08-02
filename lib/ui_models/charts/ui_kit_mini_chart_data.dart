import 'package:flutter/material.dart';

class UiKitMiniChartData {
  final String title;
  final List<UiKitMiniChartDataItem> items;
  final num value;
  final num progress;
  final String? valueMetricsName;
  final Color color;

  UiKitMiniChartData({
    required this.title,
    required this.items,
    required this.progress,
    required this.value,
    required this.color,
    this.valueMetricsName,
  });
}

class UiKitMiniChartDataItem {
  final DateTime time;
  final num value;

  UiKitMiniChartDataItem({
    required this.time,
    required this.value,
  });
}
