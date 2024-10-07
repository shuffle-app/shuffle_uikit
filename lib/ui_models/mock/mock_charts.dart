import 'dart:math';
import 'dart:ui';

import 'package:shuffle_uikit/shuffle_uikit.dart';

final mockAdditionalData = UiKitLineChartAdditionalData(
  title: 'Gender and Age',
  dataItems: [
    UiKitLineChartAdditionalDataItem(
      identifier: '18-24',
      mask: '18 - 24',
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
      identifier: '25-35',
      mask: '25 - 35',
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
      identifier: '36-45',
      mask: '36 - 45',
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
      identifier: '46-50',
      mask: '46 - 50',
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
      identifier: '50+',
      mask: '50+',
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
      iconData: ShuffleUiKitIcons.starfill,
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
      iconData: ShuffleUiKitIcons.starfill,
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
      iconData: ShuffleUiKitIcons.starfill,
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
      datasets: List.generate(
        15,
        (index) => UiKitLineChartDataSet<double>(
          value: Random().nextDouble() * 1000,
          date: DateTime.now().subtract(Duration(days: index)),
        ),
      ),
    ),
    UiKitLineChartItemData<double>(
      id: 2,
      chartItemName: S.current.BookingsHeading,
      gradient: GradientFoundation.defaultLinearGradient,
      datasets: List.generate(
        15,
        (index) => UiKitLineChartDataSet<double>(
          value: Random().nextDouble() * 1000,
          date: DateTime.now().subtract(Duration(days: index)),
        ),
      ),
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
