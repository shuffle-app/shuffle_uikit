import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_models/charts/ui_kit_mini_chart_data.dart';

extension MiniChartDataExtension on List<UiKitMiniChartData> {
  num get minValue => 0;

  num get maxValue => fold(0, (prev, curr) => prev > curr.items.maxValue ? prev : curr.items.maxValue);

  DateTimeRange get period {
    final DateTime minDate =
        fold(DateTime.now(), (prev, curr) => prev.isBefore(curr.items.period.start) ? prev : curr.items.period.start);
    final DateTime maxDate =
        fold(DateTime(0), (prev, curr) => prev.isAfter(curr.items.period.end) ? prev : curr.items.period.end);

    if(maxDate.isBefore(minDate)) {
      return DateTimeRange(start: minDate, end: DateTime.now());
    }

    return DateTimeRange(start: minDate, end: maxDate);
  }
}

extension MiniChartDataItemExtension on List<UiKitMiniChartDataItem> {
  num get maxValue => fold(0, (prev, curr) => prev > curr.value ? prev : curr.value);

  DateTimeRange get period => DateTimeRange(start: minDate, end: maxDate);

  DateTime get minDate => fold(DateTime.now(), (prev, curr) => prev.isBefore(curr.time) ? prev : curr.time);

  DateTime get maxDate => fold(DateTime.now(), (prev, curr) => prev.isAfter(curr.time) ? prev : curr.time);

  num get sum => fold(0, (prev, curr) => prev + curr.value);
}
