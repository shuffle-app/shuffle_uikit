import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';

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
