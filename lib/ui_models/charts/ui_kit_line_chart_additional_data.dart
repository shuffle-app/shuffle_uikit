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

  bool get isEmpty => dataItems.isEmpty;

  bool get isNotEmpty => !isEmpty;

  UiKitLineChartAdditionalData copyWith({
    String? title,
    List<UiKitLineChartAdditionalDataItem>? dataItems,
  }) {
    return UiKitLineChartAdditionalData(
      title: title ?? this.title,
      dataItems: dataItems ?? this.dataItems,
    );
  }

  @override
  String toString() => 'UiKitLineChartAdditionalData(title: $title, dataItems: [$dataItems])';
}

class UiKitLineChartAdditionalDataItem {
  final String mask;
  final String identifier;
  final List<UiKitLineChartAdditionalDataItemGroup> groupedValues;

  UiKitLineChartAdditionalDataItem({
    required this.mask,
    required this.groupedValues,
    required this.identifier,
  });

  UiKitLineChartAdditionalDataItem copyWith({
    List<UiKitLineChartAdditionalDataItemGroup>? groupedValues,
  }) {
    return UiKitLineChartAdditionalDataItem(
      mask: mask,
      identifier: identifier,
      groupedValues: groupedValues ?? this.groupedValues,
    );
  }

  @override
  String toString() =>
      'UiKitLineChartAdditionalDataItem(mask: $mask, identifier: $identifier, groupedValues: $groupedValues)';
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

  @override
  String toString() => 'UiKitLineChartAdditionalDataItemGroup(name: $name, value: $value, color: $color)';
}
