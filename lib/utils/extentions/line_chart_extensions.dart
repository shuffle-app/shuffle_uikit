import 'package:collection/collection.dart';
import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';
import 'package:shuffle_uikit/ui_models/charts/ui_kit_line_chart_additional_data.dart';

extension ChartNumberDataSetExtension on List<UiKitChartDataSet> {
  num get maxValue =>
      fold(0, (previousValue, element) => element.value > previousValue ? element.value : previousValue);

  num get minValue =>
      fold(maxValue, (previousValue, element) => element.value < previousValue ? element.value : previousValue);

  num get averageValue => (maxValue + minValue) ~/ 2;

  List<String> medianValues(int count) {
    final values = <String>[];
    final step = (maxValue - minValue) ~/ (count + 1);
    for (var i = 1; i <= count; i++) {
      values.insert(0, (minValue + (i * step)).toString());
    }
    return values;
  }

  num? get upperMedian {
    if (this.length <= 4) return null;

    final sortedValues = map((e) => e.value).toList()..sort((a, b) => a.compareTo(b));
    final length = sortedValues.length;
    final subList = sortedValues.sublist(length ~/ 2, length);
    return subList.reduce((value, element) => value + element) ~/ subList.length;
  }

  num? get lowerMedian {
    if (this.length <= 4) return null;

    final sortedValues = map((e) => e.value).toList()..sort((a, b) => a.compareTo(b));
    final length = sortedValues.length;
    final subList = sortedValues.sublist(0, length ~/ 2);
    return subList.reduce((value, element) => value + element) ~/ subList.length;
  }

  DateTime get minDate => fold(
      DateTime.now(), (previousValue, element) => element.date.isBefore(previousValue) ? element.date : previousValue);

  DateTime get maxDate => fold(
      DateTime.now(), (previousValue, element) => element.date.isAfter(previousValue) ? element.date : previousValue);
}

extension ChartItemsExtension on List<UiKitChartItem> {
  num get maxValue {
    final maxValue = fold<num>(
        0,
        (previousValue, element) =>
            element.datasets.maxValue > previousValue ? element.datasets.maxValue : previousValue);
    if (maxValue == 0) return 1.0;
    return maxValue;
  }

  num get minValue => fold(
      maxValue,
      (previousValue, element) =>
          element.datasets.minValue < previousValue ? element.datasets.minValue : previousValue);

  num get averageValue => (maxValue + minValue) ~/ 2;

  List<String> medianValues(int count) {
    final values = <String>[];
    final step = (maxValue - minValue) ~/ (count + 1);
    for (var i = 1; i <= count; i++) {
      values.insert(0, (minValue + (i * step)).toInt().toString());
    }
    return values;
  }

  num? get upperMedian {
    if (this.length <= 4) return null;

    final sortedValues = map((e) => e.datasets.maxValue).toList()..sort((a, b) => a.compareTo(b));
    final length = sortedValues.length;
    final subList = sortedValues.sublist(length ~/ 2, length);
    return subList.reduce((value, element) => value + element) ~/ subList.length;
  }

  num? get lowerMedian {
    if (this.length <= 4) return null;

    final sortedValues = map((e) => e.datasets.minValue).toList()..sort((a, b) => a.compareTo(b));
    final length = sortedValues.length;
    final subList = sortedValues.sublist(0, length ~/ 2);
    return subList.reduce((value, element) => value + element) ~/ subList.length;
  }

  DateRange get period {
    final minDate = fold(
        DateTime.now(),
        (previousValue, element) =>
            element.datasets.minDate.isBefore(previousValue) ? element.datasets.minDate : previousValue);
    final maxDate = fold(
        DateTime.now(),
        (previousValue, element) =>
            element.datasets.maxDate.isAfter(previousValue) ? element.datasets.maxDate : previousValue);
    return DateRange(start: minDate, end: maxDate);
  }

  List<DateTime> get dates {
    final dates = map((e) => e.datasets.map((e) => e.date)).expand((element) => element).toList(growable: true);
    final List<DateTime> uniqueDates = [];
    for (final date in dates) {
      final uniqueDateIndex = uniqueDates
          .indexWhere((element) => element.year == date.year && element.month == date.month && element.day == date.day);
      if (uniqueDateIndex.isNegative) uniqueDates.add(date);
    }
    return uniqueDates;
  }

  DateTime get earliestDate => fold(
      DateTime.now(),
      (previousValue, element) =>
          element.datasets.minDate.isBefore(previousValue) ? element.datasets.minDate : previousValue);

  DateTime get latestDate => fold(
      DateTime.now(),
      (previousValue, element) =>
          element.datasets.maxDate.isAfter(previousValue) ? element.datasets.maxDate : previousValue);
}

extension ChartItemDataExtension on List<UiKitLineChartItemData> {
  List<UiKitLineChartItemData> chartItemsWithDatasetAt(int index) {
    final items = where((chartItem) => chartItem.datasets.length - 1 >= index).toList();
    final finalList = items
        .map(
          (chartItem) => UiKitLineChartItemData(
            chartItemName: chartItem.chartItemName,
            color: chartItem.color,
            gradient: chartItem.gradient,
            datasets: [chartItem.datasets[index]],
            id: chartItem.id,
          ),
        )
        .toList();
    return finalList;
  }

  int get maxDatasetsCount => fold(
        0,
        (previousValue, element) => element.datasets.length > previousValue ? element.datasets.length : previousValue,
      );

  List<DateTime> getNDates(int n) {
    final datesToReturn = List<DateTime>.empty(growable: true);
    final step = dates.length ~/ (n - 3);
    datesToReturn.add(dates.first);
    for (int i = 1; i < n - 2; i++) {
      final index = i * step;
      if (index >= dates.length) continue;
      datesToReturn.add(dates.elementAt(index));
    }
    datesToReturn.add(dates.last);

    return datesToReturn;
  }
}

extension LineChartAdditionalDataExtension on List<UiKitLineChartAdditionalDataItem> {
  double get total => fold(
      0,
      (previousValue, element) =>
          element.groupedValues.fold<double>(0, (previousValue, element) => element.value + previousValue) +
          previousValue);

  double groupPercentage(String groupName) {
    final groupValue = overallValueOfGroup(groupName);
    return groupValue / total * 100;
  }

  num overallValueOfGroup(String groupName) {
    return fold(
      0,
      (previousValue, element) => element.groupedValues.groupValue(groupName) + previousValue,
    );
  }

  List<UiKitLineChartAdditionalDataItemGroup> get uniqueGroups {
    final groups = <UiKitLineChartAdditionalDataItemGroup>[];
    for (final item in this) {
      for (final group in item.groupedValues) {
        final index = groups.indexWhere((element) => element.name == group.name);
        if (index.isNegative) groups.add(group);
      }
    }
    return groups;
  }

  List<String> get uniqueGroupNames => expand((element) => element.groupedValues.map((e) => e.name)).toSet().toList();

  num get overallValue =>
      uniqueGroupNames.fold(0, (previousValue, element) => overallValueOfGroup(element) + previousValue);

  bool get hasExceededMaxValue => overallValue > 100;
}

extension LineChartAdditionalDataItemGroupExtension on List<UiKitLineChartAdditionalDataItemGroup> {
  num groupValue(String groupName) {
    final group = firstWhereOrNull((element) => element.name == groupName);
    if (group == null) return 0;

    return group.value;
  }

  double get groupTotal => fold(0, (previousValue, element) => element.value + previousValue);

  double groupItemPercentage(String groupName) {
    final givenGroupValue = groupValue(groupName);
    if (groupTotal == 0) return 0;
    return givenGroupValue / groupTotal;
  }
}
