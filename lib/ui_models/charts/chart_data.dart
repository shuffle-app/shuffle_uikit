import 'package:flutter/material.dart';

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
  final String? icon;
  final List<UiKitChartDataSet<T>> datasets;

  UiKitChartItem({
    required this.datasets,
    required this.chartItemName,
    this.color,
    this.gradient,
    this.icon,
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

  UiKitLineChartData({
    required String title,
    required this.items,
    this.subtitle,
    this.popUpMenuOptions,
  }) : super(chartTitle: title, items: items);

  factory UiKitLineChartData.empty() => UiKitLineChartData<T>(
        title: '',
        items: [],
      );

  bool get isEmpty => items.isEmpty && chartTitle.isEmpty;
}

class UiKitLineChartItemData<T> extends UiKitChartItem<T> {
  UiKitLineChartItemData({
    Color? color,
    required List<UiKitChartDataSet<T>> datasets,
    required String chartItemName,
    Gradient? gradient,
    String? icon,
  }) : super(
          icon: icon,
          color: color,
          datasets: datasets,
          gradient: gradient,
          chartItemName: chartItemName,
        );
}

class UiKitLineChartDataSet<T> extends UiKitChartDataSet<T> {
  UiKitLineChartDataSet({
    required DateTime date,
    required T value,
  }) : super(date: date, value: value);
}
