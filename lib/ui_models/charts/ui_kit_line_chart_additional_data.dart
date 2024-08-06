import 'package:flutter/material.dart';

class UiKitLineChartAdditionalData {
  final String title;
  final List<UiKitLineChartAdditionalDataItem> dataItems;

  UiKitLineChartAdditionalData({
    required this.title,
    required this.dataItems,
  });

  factory UiKitLineChartAdditionalData.empty() {
    return UiKitLineChartAdditionalData(
      title: '',
      dataItems: [],
    );
  }
}

class UiKitLineChartAdditionalDataItem {
  final String name;
  final List<UiKitLineChartAdditionalDataItemGroup> groupedValues;

  UiKitLineChartAdditionalDataItem({
    required this.name,
    required this.groupedValues,
  });
}

class UiKitLineChartAdditionalDataItemGroup {
  final String name;
  final double value;
  final Color color;

  UiKitLineChartAdditionalDataItemGroup({
    required this.name,
    required this.value,
    required this.color,
  });
}
