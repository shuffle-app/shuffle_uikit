import 'package:flutter/material.dart';

abstract class UiKitChartData<T> {
  final String title;
  final List<UiKitChartItem> items;

  UiKitChartData({
    required this.title,
    required this.items,
  });
}

abstract class UiKitChartItem<T> {
  final Color? color;
  final Gradient? gradient;
  final List<UiKitChartDataSet<T>> datasets;

  UiKitChartItem({
    this.color,
    required this.datasets,
    this.gradient,
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

  UiKitLineChartData({
    required String title,
    required this.items,
  }) : super(title: title, items: items);
}

class UiKitLineChartItemData<T> extends UiKitChartItem<T> {
  UiKitLineChartItemData({
    Color? color,
    required List<UiKitChartDataSet<T>> datasets,
    Gradient? gradient,
  }) : super(color: color, datasets: datasets, gradient: gradient);
}

class UiKitLineChartDataSet<T> extends UiKitChartDataSet<T> {
  UiKitLineChartDataSet({
    required DateTime date,
    required T value,
  }) : super(date: date, value: value);
}
