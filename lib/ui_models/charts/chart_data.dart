import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_models/charts/ui_kit_line_chart_additional_data.dart';

abstract class UiKitChartData<T> {
  final String chartTitle;
  final List<UiKitChartItem> items;

  UiKitChartData({
    required this.chartTitle,
    required this.items,
  });
}

abstract class UiKitChartItem<T> {
  final Color? color;
  final Gradient? gradient;
  final String chartItemName;
  final String? iconPath;
  final IconData? icon;
  final List<UiKitChartDataSet<T>> datasets;
  final int id;

  UiKitChartItem({
    required this.id,
    required this.datasets,
    required this.chartItemName,
    this.icon,
    this.color,
    this.gradient,
    this.iconPath,
  });
}

abstract class UiKitChartDataSet<T> {
  final DateTime date;
  final T value;

  UiKitChartDataSet({
    required this.date,
    required this.value,
  });
}

class DateRange {
  final DateTime start;
  final DateTime end;

  DateRange({
    required this.start,
    required this.end,
  });
}

class UiKitLineChartData<T> extends UiKitChartData<T> {
  /// overriding field to typecast [items] to list [UiKitLineChartItemData] of type [T]
  @override
  final List<UiKitLineChartItemData<T>> items;
  final String? subtitle;
  final List<String>? popUpMenuOptions;
  final UiKitLineChartAdditionalData? additionalData;

  UiKitLineChartData({
    required String title,
    required this.items,
    this.subtitle,
    this.popUpMenuOptions,
    this.additionalData,
  }) : super(chartTitle: title, items: items);

  factory UiKitLineChartData.empty() => UiKitLineChartData<T>(
        title: '',
        items: [],
      );

  bool get isEmpty => items.isEmpty && chartTitle.isEmpty;

  UiKitLineChartData<T> copyWith({
    String? title,
    List<UiKitLineChartItemData<T>>? items,
    String? subtitle,
    List<String>? popUpMenuOptions,
    UiKitLineChartAdditionalData? additionalData,
  }) {
    return UiKitLineChartData<T>(
      title: title ?? this.chartTitle,
      items: items ?? this.items,
      subtitle: subtitle ?? this.subtitle,
      popUpMenuOptions: popUpMenuOptions ?? this.popUpMenuOptions,
      additionalData: additionalData ?? this.additionalData,
    );
  }
}

class UiKitLineChartItemData<T> extends UiKitChartItem<T> {
  UiKitLineChartItemData({
    Color? color,
    required List<UiKitChartDataSet<T>> datasets,
    required String chartItemName,
    required int id,
    Gradient? gradient,
    String? icon,
    IconData? iconData,
  }) : super(
          iconPath: icon,
          icon: iconData,
          color: color,
          datasets: datasets,
          gradient: gradient,
          chartItemName: chartItemName,
          id: id,
        );
}

class UiKitLineChartDataSet<T> extends UiKitChartDataSet<T> {
  UiKitLineChartDataSet({
    required DateTime date,
    required T value,
  }) : super(date: date, value: value);
}
