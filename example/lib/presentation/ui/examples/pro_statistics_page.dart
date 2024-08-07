import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProStatisticsPage extends StatefulWidget {
  const ProStatisticsPage({Key? key}) : super(key: key);

  @override
  State<ProStatisticsPage> createState() => _ProStatisticsPageState();
}

class _ProStatisticsPageState extends State<ProStatisticsPage> with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 3, vsync: this);

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Scaffold(
      body: BlurredAppBarPage(
        centerTitle: true,
        title: 'Pro Statistics',
        autoImplyLeading: true,
        childrenPadding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.horizontal16),
        children: [
          SpacingFoundation.verticalSpace16,
          UiKitTabBarWithUnderlineIndicator(
            tabController: tabController,
            onTappedTab: (index) {},
            tabs: const [
              CustomTabData(title: 'General'),
              CustomTabData(title: 'Organic'),
              CustomTabData(title: 'Promotion'),
            ],
          ),
          SpacingFoundation.verticalSpace16,
          UiKitLineChart(
            chartData: mockProAccountStats,
            chartAdditionalData: mockAdditionalData,
          ),
          SpacingFoundation.verticalSpace16,
          UiKitLineChart(
            chartData: mockFeedbackStats,
          ),
          SpacingFoundation.verticalSpace16,
          UiKitLineChart(
            chartData: mockBookingAndFavorites,
          ),
          SpacingFoundation.verticalSpace16,
          UiKitLineChart(
            chartData: mockInvitations,
          ),
          SpacingFoundation.verticalSpace16,
          UiKitCardWrapper(
            padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
            child: UiKitMiniChart(
              data: mockedMiniChartData,
            ),
          ),
          SpacingFoundation.verticalSpace16,
          Text(
            'Unique statistics',
            style: boldTextTheme?.title1,
          ),
          SpacingFoundation.verticalSpace16,
          UiKitCardWrapper(
            padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UiKitGlowingProgressIndicator(
                  maxWidth: 1.sw - 16,
                  progressColor: ColorsFoundation.warning,
                  maxValue: 10,
                  value: 5,
                  title: 'Event rating (by feedback)',
                ),
                UiKitRoundedDivider(
                  thickness: 2,
                  height: SpacingFoundation.verticalSpacing32,
                ),
                UiKitVerticalTitledInfoBoard(
                  title: 'Portrait of the most active segment',
                  infoList: [
                    TitledInfoModel(
                      title: S.current.Gender,
                      info: S.current.Male,
                    ),
                    TitledInfoModel(
                      title: 'Age',
                      info: '36-45 y.o',
                    ),
                    TitledInfoModel(
                      title: 'Interests',
                      info: 'Snowboard, Free Ride, Hookah, Dance',
                    ),
                  ],
                ),
                UiKitRoundedDivider(
                  thickness: 2,
                  height: SpacingFoundation.verticalSpacing32,
                ),
                SizedBox(
                  width: 1.sw - 32,
                  child: Text(
                    S.current.ViewSources,
                    style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.mutedText),
                    textAlign: TextAlign.start,
                  ),
                ),
                SpacingFoundation.verticalSpace2,
                SizedBox(
                  height: 0.275625.sw,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 4,
                        child: UiKitPieChart(data: mockPieChart),
                      ),
                      SpacingFoundation.horizontalSpace24,
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: mockPieChart.legend
                              .map<Widget>(
                                (legendItem) => UiKitChartLegendWidget(
                                  valueTitle: legendItem.title,
                                  value: legendItem.value,
                                  leading: Container(
                                    width: SpacingFoundation.verticalSpacing8,
                                    height: SpacingFoundation.verticalSpacing8,
                                    decoration: BoxDecoration(
                                      color: legendItem.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ).paddingSymmetric(vertical: EdgeInsetsFoundation.vertical2),
                      ),
                    ],
                  ),
                ),
                UiKitRoundedDivider(
                  thickness: 2,
                  height: SpacingFoundation.verticalSpacing32,
                ),
                UiKitRankedTitledBoard(
                  title:
                      'Top events for ${formatDateWithCustomPattern('MMMM dd', DateTime.now().subtract(const Duration(days: 2)))}',
                  rankItems: [
                    '80’s theme invites only party',
                    'Asian Street by Thai',
                    'First summer dance',
                  ],
                ),
                UiKitRoundedDivider(
                  thickness: 2,
                  height: SpacingFoundation.verticalSpacing32,
                ),
                UiKitGlowingProgressIndicator(
                  maxWidth: 1.sw - 16,
                  progressColor: ColorsFoundation.success,
                  maxValue: 10,
                  value: 8,
                  title: 'Overall rating of interest',
                ),
              ],
            ),
          ),
          SpacingFoundation.bottomNavigationBarSpacing,
        ],
      ),
    );
  }
}
