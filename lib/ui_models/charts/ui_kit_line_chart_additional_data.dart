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

  factory UiKitLineChartAdditionalData.merge(Iterable<UiKitLineChartAdditionalData> list) {
    if (list.isEmpty) throw UnimplementedError('Cannot merge empty list');

    if (!list.every((item) => item.title == list.first.title)) {
      throw UnimplementedError('Cannot merge items with different titles');
    }

    if (list.every((item) => item.dataItems.isEmpty)) return UiKitLineChartAdditionalData.empty();

    final allDataItems = list.expand((element) => element.dataItems);
    final mergedDataItems = allDataItems.map((e) => e.identifier).toSet().map((id) {
      final items = allDataItems.where((element) => element.identifier == id).toList();
      final allGroupedValues = items.expand((element) => element.groupedValues);
      final uniqueGroupNames = allGroupedValues.map((e) => e.name).toSet();
      final groupedValues = uniqueGroupNames.map((name) {
        final values = allGroupedValues.where((element) => element.name == name).toList();
        final value = values.fold<double>(0, (previousValue, element) => previousValue + element.value);
        final color = values.first.color;
        return UiKitLineChartAdditionalDataItemGroup(name: name, value: value, color: color);
      }).toList();
      return UiKitLineChartAdditionalDataItem(
        mask: items.firstWhere((e) => e.identifier == id).mask,
        identifier: id,
        groupedValues: groupedValues,
      );
    }).toList();

    return UiKitLineChartAdditionalData(
      title: list.first.title,
      dataItems: mergedDataItems,
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
