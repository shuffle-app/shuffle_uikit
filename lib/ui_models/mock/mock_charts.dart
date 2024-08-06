import 'dart:math';
import 'dart:ui';

import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';
import 'package:shuffle_uikit/ui_models/charts/pie_chart_data.dart';

final UiKitLineChartData<double> mockLineChart = UiKitLineChartData<double>(
  title: S.current.BookingsAndInvites,
  items: [
    UiKitLineChartItemData<double>(
      chartItemName: S.current.Invites,
      color: ColorsFoundation.pink,
      datasets: [
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 12)),
          value: 56,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 11)),
          value: 123,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 10)),
          value: 44,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 9)),
          value: 522,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 8)),
          value: 55,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 7)),
          value: 234,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 6)),
          value: 124,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 5)),
          value: 633,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 4)),
          value: 11,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 3)),
          value: 321,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 2)),
          value: 401,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 1)),
          value: 234,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now(),
          value: 193,
        ),
      ],
    ),
    UiKitLineChartItemData<double>(
      chartItemName: S.current.BookingsHeading,
      gradient: GradientFoundation.defaultLinearGradient,
      datasets: [
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 12)),
          value: 33,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 11)),
          value: 313,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 10)),
          value: 245,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 9)),
          value: 150,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 8)),
          value: 67,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 7)),
          value: 65,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 6)),
          value: 98,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 5)),
          value: 123,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 4)),
          value: 189,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 3)),
          value: 288,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 2)),
          value: 360,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(const Duration(days: 1)),
          value: 456,
        ),
        UiKitLineChartDataSet<double>(
          date: DateTime.now(),
          value: 789,
        ),
      ],
    ),
  ],
);

final UiKitPieChartData mockPieChart = UiKitPieChartData(
  chartName: S.current.ViewSources,
  items: [
    UiKitPieCharItemData(
      color: const Color(0xff8DC1FF),
      value: 62,
      itemName: 'Randomizer',
    ),
    UiKitPieCharItemData(
      color: const Color(0xff5BA3FF),
      value: 8,
      itemName: 'Feelings',
    ),
    UiKitPieCharItemData(
      color: const Color(0xff3088FF),
      value: 18,
      itemName: S.current.Search,
    ),
    UiKitPieCharItemData(
      color: ColorsFoundation.info,
      value: 12,
      itemName: 'Spinner',
    ),
  ],
);

final mockedMiniChartData = [
  UiKitMiniChartData(
    title: 'Video-reactions',
    color: ColorsFoundation.info,
    items: List.generate(
      10,
      (index) => UiKitMiniChartDataItem(
        time: DateTime.now().subtract(Duration(days: index)),
        value: Random().nextInt(100),
      ),
    ),
    value: 32,
    progress: 2.45,
  ),
  UiKitMiniChartData(
    title: 'Average card visit time',
    color: ColorsFoundation.info,
    items: List.generate(
      10,
      (index) => UiKitMiniChartDataItem(
        time: DateTime.now().subtract(Duration(days: index)),
        value: Random().nextInt(100),
      ),
    ),
    value: 15,
    progress: -2.45,
    valueMetricsName: 'min',
  ),
  UiKitMiniChartData(
    title: 'Routes to the place',
    color: ColorsFoundation.info,
    items: List.generate(
      10,
      (index) => UiKitMiniChartDataItem(
        time: DateTime.now().subtract(Duration(days: index)),
        value: Random().nextInt(100),
      ),
    ),
    value: 12,
    progress: -2.45,
  ),
];
