import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_models/charts/pie_chart_data.dart';

extension UiKitPieChartItemsExt on List<UiKitPieCharItemData> {
  /// get sum of all values in the list
  num get sum => fold<num>(0, (previousValue, element) => previousValue + element.value);

  /// gets sorted list by value ascending
  List<UiKitPieCharItemData> get sortedByValueAsc => this.toList()..sort((a, b) => a.value.compareTo(b.value));

  /// gets sorted list by value descending
  List<UiKitPieCharItemData> get sortedByValueDesc => this.toList()..sort((a, b) => b.value.compareTo(a.value));

  /// gets legend items
  List<UiKitPieChartLegendItem> get legendItems {
    return sortedByValueAsc
        .map((e) => UiKitPieChartLegendItem(
              color: e.color,
              title: e.itemName,
              value: '${e.value}${e.itemValueMetricsName}',
            ))
        .toList();
  }
}
