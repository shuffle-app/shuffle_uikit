import 'dart:math';
import 'dart:ui';

import 'package:shuffle_uikit/shuffle_uikit.dart';

final mockAdditionalData = UiKitLineChartAdditionalData(
  title: 'Gender and Age',
  dataItems: [
    UiKitLineChartAdditionalDataItem(
      name: '18 - 24',
      groupedValues: [
        UiKitLineChartAdditionalDataItemGroup(
          name: 'male',
          value: 0,
          color: const Color(0xffffffff),
        ),
        UiKitLineChartAdditionalDataItemGroup(
          name: 'female',
          value: 0,
          color: ColorsFoundation.darkNeutral900,
        ),
        UiKitLineChartAdditionalDataItemGroup(
          name: 'other',
          value: 0,
          color: ColorsFoundation.darkNeutral600,
        ),
      ],
    ),
    UiKitLineChartAdditionalDataItem(
      name: '25 -35',
      groupedValues: [
        UiKitLineChartAdditionalDataItemGroup(
          name: 'male',
          value: 10,
          color: const Color(0xffffffff),
        ),
        UiKitLineChartAdditionalDataItemGroup(
          name: 'female',
          value: 18,
          color: ColorsFoundation.darkNeutral900,
        ),
        UiKitLineChartAdditionalDataItemGroup(
          name: 'other',
          value: 0,
          color: ColorsFoundation.darkNeutral600,
        ),
      ],
    ),
    UiKitLineChartAdditionalDataItem(
      name: '36 - 45',
      groupedValues: [
        UiKitLineChartAdditionalDataItemGroup(
          name: 'male',
          value: 0,
          color: const Color(0xffffffff),
        ),
        UiKitLineChartAdditionalDataItemGroup(
          name: 'female',
          value: 0,
          color: ColorsFoundation.darkNeutral900,
        ),
        UiKitLineChartAdditionalDataItemGroup(
          name: 'other',
          value: 0,
          color: ColorsFoundation.darkNeutral600,
        ),
      ],
    ),
    UiKitLineChartAdditionalDataItem(
      name: '45 - 50',
      groupedValues: [
        UiKitLineChartAdditionalDataItemGroup(
          name: 'male',
          value: 30,
          color: const Color(0xffffffff),
        ),
        UiKitLineChartAdditionalDataItemGroup(
          name: 'female',
          value: 48,
          color: ColorsFoundation.darkNeutral900,
        ),
        UiKitLineChartAdditionalDataItemGroup(
          name: 'other',
          value: 0,
          color: ColorsFoundation.darkNeutral600,
        ),
      ],
    ),
    UiKitLineChartAdditionalDataItem(
      name: '50+',
      groupedValues: [
        UiKitLineChartAdditionalDataItemGroup(
          name: 'male',
          value: 0,
          color: const Color(0xffffffff),
        ),
        UiKitLineChartAdditionalDataItemGroup(
          name: 'female',
          value: 0,
          color: ColorsFoundation.darkNeutral900,
        ),
        UiKitLineChartAdditionalDataItemGroup(
          name: 'other',
          value: 0,
          color: ColorsFoundation.darkNeutral600,
        ),
      ],
    ),
  ],
);

final mockFeedbackStats = UiKitLineChartData<num>(
  title: 'Feedback',
  items: [
    UiKitLineChartItemData<num>(
      id: 1,
      chartItemName: '5',
      icon: GraphicsFoundation.instance.svg.star.path,
      color: ColorsFoundation.success,
      datasets: List.generate(
        10,
        (index) => UiKitLineChartDataSet<num>(
          date: DateTime.now().subtract(Duration(days: index)),
          value: Random().nextInt(100),
        ),
      ),
    ),
    UiKitLineChartItemData<num>(
      id: 2,
      chartItemName: '3-4',
      icon: GraphicsFoundation.instance.svg.star.path,
      color: ColorsFoundation.warning,
      datasets: List.generate(
        10,
        (index) => UiKitLineChartDataSet<num>(
          date: DateTime.now().subtract(Duration(days: index)),
          value: Random().nextInt(100),
        ),
      ),
    ),
    UiKitLineChartItemData<num>(
      id: 3,
      chartItemName: '1-2',
      icon: GraphicsFoundation.instance.svg.star.path,
      color: ColorsFoundation.error,
      datasets: List.generate(
        10,
        (index) => UiKitLineChartDataSet<num>(
          date: DateTime.now().subtract(Duration(days: index)),
          value: Random().nextInt(100),
        ),
      ),
    ),
  ],
);

final mockBookingAndFavorites = UiKitLineChartData<num>(
  title: 'Bookings and Favorites',
  items: [
    UiKitLineChartItemData(
      id: 1,
      datasets: List.generate(
        10,
        (index) => UiKitLineChartDataSet<num>(
          date: DateTime.now().subtract(Duration(days: index)),
          value: Random().nextInt(100),
        ),
      ),
      chartItemName: 'Booking',
      color: ColorsFoundation.success,
    ),
    UiKitLineChartItemData(
      id: 2,
      datasets: List.generate(
        10,
        (index) => UiKitLineChartDataSet<num>(
          date: DateTime.now().subtract(Duration(days: index)),
          value: Random().nextInt(100),
        ),
      ),
      chartItemName: 'Favorites',
      color: ColorsFoundation.info,
    ),
  ],
);

final mockInvitations = UiKitLineChartData<num>(
  title: 'Invitations',
  items: [
    UiKitLineChartItemData(
      id: 1,
      datasets: List.generate(
        10,
        (index) => UiKitLineChartDataSet<num>(
          date: DateTime.now().subtract(Duration(days: index)),
          value: Random().nextInt(100),
        ),
      ),
      chartItemName: 'Invitations',
      color: ColorsFoundation.info,
    ),
  ],
);

final mockProAccountGeneralStats = UiKitLineChartData<num>(
  title: 'Coverage',
  subtitle: 'Budget 20\$',
  popUpMenuOptions: [
    S.current.Settings,
    S.current.DownloadPdf,
  ],
  items: [
    UiKitLineChartItemData<double>(
      chartItemName: 'Views',
      id: 1,
      color: ColorsFoundation.success,
      datasets: List.generate(
        10,
        (index) => UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(Duration(days: index)),
          value: Random().nextDouble() * index * 1000,
        ),
      ),
    ),
    UiKitLineChartItemData<double>(
      chartItemName: 'Visitors',
      id: 2,
      color: ColorsFoundation.info,
      datasets: List.generate(
        10,
        (index) => UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(Duration(days: index)),
          value: Random().nextDouble() * index * 1000,
        ),
      ),
    ),
  ],
);

final mockProAccountOrganicStats = UiKitLineChartData<num>(
  title: 'Coverage',
  popUpMenuOptions: [
    S.current.Settings,
    S.current.DownloadPdf,
  ],
  items: [
    UiKitLineChartItemData<double>(
      chartItemName: 'Views',
      id: 1,
      color: ColorsFoundation.success,
      datasets: List.generate(
        10,
        (index) => UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(Duration(days: index)),
          value: Random().nextDouble() * index * 1000,
        ),
      ),
    ),
    UiKitLineChartItemData<double>(
      chartItemName: 'Visitors',
      id: 2,
      color: ColorsFoundation.info,
      datasets: List.generate(
        10,
        (index) => UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(Duration(days: index)),
          value: Random().nextDouble() * index * 1000,
        ),
      ),
    ),
  ],
);

final mockProAccountPromotionStats = UiKitLineChartData<num>(
  title: 'Coverage',
  subtitle: 'Budget 20\$',
  popUpMenuOptions: [
    S.current.Settings,
    S.current.DownloadPdf,
  ],
  items: [
    UiKitLineChartItemData<double>(
      chartItemName: 'Views',
      id: 1,
      color: ColorsFoundation.success,
      datasets: List.generate(
        10,
        (index) => UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(Duration(days: index)),
          value: Random().nextDouble() * index * 1000,
        ),
      ),
    ),
    UiKitLineChartItemData<double>(
      chartItemName: 'Visitors',
      id: 2,
      color: ColorsFoundation.info,
      datasets: List.generate(
        10,
        (index) => UiKitLineChartDataSet<double>(
          date: DateTime.now().subtract(Duration(days: index)),
          value: Random().nextDouble() * index * 1000,
        ),
      ),
    ),
  ],
);

final UiKitLineChartData<double> mockLineChart = UiKitLineChartData<double>(
  title: S.current.BookingsAndInvites,
  items: [
    UiKitLineChartItemData<double>(
      id: 1,
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
      id: 2,
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
      color: ColorsFoundation.info,
      value: 68,
      itemName: 'Randomizer',
    ),
    UiKitPieCharItemData(
      color: const Color(0xff8DC1FF),
      value: 2,
      itemName: 'Feelings',
    ),
    UiKitPieCharItemData(
      color: const Color(0xff3088FF),
      value: 20,
      itemName: S.current.Search,
    ),
    UiKitPieCharItemData(
      color: const Color(0xff5BA3FF),
      value: 10,
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
