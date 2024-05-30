import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/organisms/charts/line_chart/ui_kit_line_chart_body.dart';
import 'package:shuffle_uikit/ui_kit/organisms/charts/line_chart/ui_kit_line_chart_small_preview.dart';
import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';
import 'package:shuffle_uikit/utils/extentions/chart_extensions.dart';

class UiKitLineChart extends StatefulWidget {
  final UiKitLineChartData<num> chartData;

  const UiKitLineChart({
    Key? key,
    required this.chartData,
  }) : super(key: key);

  @override
  State<UiKitLineChart> createState() => _UiKitLineChartState();
}

class _UiKitLineChartState extends State<UiKitLineChart> {
  final ScrollController _datesScrollController = ScrollController();
  final ScrollController _chartScrollController = ScrollController();

  final bool smallScreen = 1.sw <= 380;

  Size get viewPortComputedSize => Size(
        1.sw - EdgeInsetsFoundation.horizontal32,
        (1.sw - EdgeInsetsFoundation.horizontal32) * 0.9,
      );

  Size get chartViewPortSize => Size(
        viewPortComputedSize.width - SpacingFoundation.verticalSpacing32,
        viewPortComputedSize.height * 0.425,
      );

  Size get smallPreviewSize => Size(
        chartViewPortSize.width,
        chartViewPortSize.width * 0.15,
      );

  double chartToSmallPreviewRatio = 1;
  double smallPreviewToChartRatio = 1;

  bool scrollingDates = false;
  bool scrollingChart = false;
  bool scrollingSmallPreview = false;
  double? datesMaxScrollPosition;
  final _smallPreviewLeftOffsetNotifier = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _datesScrollController.addListener(_datesScrollListener);
      _chartScrollController.addListener(_chartScrollListener);
      setState(() {
        datesMaxScrollPosition =
            _datesScrollController.position.maxScrollExtent + (chartViewPortSize.width - SpacingFoundation.horizontalSpacing32);
        // ((smallScreen ? 62 : 66) * widget.chartData.items.dates.length) +
        // ((widget.chartData.items.dates.length - 1) * SpacingFoundation.horizontalSpacing4);
      });
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          chartToSmallPreviewRatio = _chartScrollController.position.maxScrollExtent / smallPreviewSize.width;
          smallPreviewToChartRatio = smallPreviewSize.width / _chartScrollController.position.maxScrollExtent;
        });
        log('datesMaxScrollPosition: $datesMaxScrollPosition');
        log('chartToSmallPreviewRatio: $chartToSmallPreviewRatio');
        log('smallPreviewToChartRatio: $smallPreviewToChartRatio');
        log('_chartScrollController.position.maxScrollExtent: ${_chartScrollController.position.maxScrollExtent}');
        log('_datesScrollController.position.maxScrollExtent: ${_datesScrollController.position.maxScrollExtent + chartViewPortSize.width}');
        log('pixels per date: ${_datesScrollController.position.maxScrollExtent / widget.chartData.items.dates.length}');
      });
    });
  }

  Future<void> _chartScrollListener() async {}

  Future<void> _datesScrollListener() async {}

  @override
  dispose() {
    _datesScrollController.dispose();
    _smallPreviewLeftOffsetNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return UiKitCardWrapper(
      height: viewPortComputedSize.height,
      width: viewPortComputedSize.width,
      borderRadius: BorderRadiusFoundation.all24,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SpacingFoundation.verticalSpace16,
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.chartData.title,
                  style: boldTextTheme?.caption2Medium,
                ),
              ),
              SpacingFoundation.horizontalSpace4,
              Text(
                '${DateFormat('MMM dd').format(widget.chartData.items.period.start)} - ${DateFormat('MMM d').format(widget.chartData.items.period.end)}',
                style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.mutedText),
              ),
            ],
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
          SpacingFoundation.verticalSpace16,
          NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollEndNotification) {
                scrollingChart = false;
              } else if (notification is ScrollStartNotification) {
                scrollingChart = true;
                scrollingSmallPreview = false;
              }
              double offset = _chartScrollController.offset;
              if (!scrollingDates) {
                _datesScrollController.jumpTo(offset);
                // if (!scrollingSmallPreview) {
                //   final smallPreviewOffset = offset - (offset * smallPreviewToChartRatio);
                //   if (smallPreviewOffset <= (smallPreviewSize.width * 0.65)) {
                //     _smallPreviewLeftOffsetNotifier.value = smallPreviewOffset;
                //   }
                // }
              }
              return false;
            },
            child: datesMaxScrollPosition == null
                ? SizedBox.fromSize(
                    size: chartViewPortSize,
                    child: const LoadingWidget(),
                  )
                : UiKitLineChartBody(
                    scrollController: _chartScrollController,
                    availableSize: chartViewPortSize,
                    chartItems: widget.chartData.items,
                    datesMaxScrollPosition: datesMaxScrollPosition,
                  ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
          ),
          SpacingFoundation.verticalSpace2,
          SizedBox(
            width: viewPortComputedSize.width,
            height: viewPortComputedSize.height * 0.06,
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification) {
                  scrollingDates = false;
                } else if (notification is ScrollStartNotification) {
                  scrollingDates = true;
                  scrollingSmallPreview = false;
                }
                double offset = _datesScrollController.offset;
                if (!scrollingChart) {
                  _chartScrollController.jumpTo(offset);
                  // if (scrollingSmallPreview) {
                  //   final smallPreviewOffset = (offset * smallPreviewToChartRatio);
                  //   if (smallPreviewOffset <= (smallPreviewSize.width * 0.65)) {
                  //     _smallPreviewLeftOffsetNotifier.value = smallPreviewOffset;
                  //   } else {
                  //     _smallPreviewLeftOffsetNotifier.value = (smallPreviewSize.width * 0.65);
                  //   }
                  // }
                }
                return false;
              },
              child: ListView.separated(
                padding: EdgeInsets.zero,
                controller: _datesScrollController,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace8,
                itemBuilder: (context, index) {
                  final date = widget.chartData.items.dates.elementAt(index);

                  return Text(
                    DateFormat('MMMd', Localizations.localeOf(context).languageCode).format(date),
                    style: regularTextTheme?.caption2.copyWith(color: ColorsFoundation.neutral40),
                  );
                },
                itemCount: widget.chartData.items.dates.length,
              ),
            ),
          ),
          SpacingFoundation.verticalSpace4,
          Align(
            alignment: Alignment.bottomCenter,
            child: UiKitLineChartSmallPreview(
              smallPreviewLeftOffsetNotifier: _smallPreviewLeftOffsetNotifier,
              chartItems: widget.chartData.items,
              size: smallPreviewSize,
              onScroll: (offset) {
                print(offset);
                final chartOffset = offset + (offset * chartToSmallPreviewRatio);
                print(chartOffset);
                setState(() => scrollingSmallPreview = true);
                if (offset == 0) {
                  _chartScrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.decelerate,
                  );
                } else {
                  _chartScrollController.jumpTo(chartOffset);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
