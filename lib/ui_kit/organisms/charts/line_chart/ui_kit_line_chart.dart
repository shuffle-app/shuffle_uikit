import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/organisms/charts/line_chart/ui_kit_line_chart_body.dart';
import 'package:shuffle_uikit/ui_kit/organisms/charts/line_chart/ui_kit_line_chart_small_preview.dart';
import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';
import 'package:shuffle_uikit/ui_models/charts/line_chart_small_preview_data.dart';
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
        viewPortComputedSize.height * 0.5,
      );

  Size get smallPreviewSize => Size(
        chartViewPortSize.width,
        chartViewPortSize.width * 0.15,
      );

  double chartToSmallPreviewRatio = 1;
  double smallPreviewToChartRatio = 1;

  bool scrollingChart = false;
  bool scrollingSmallPreview = false;
  double? datesMaxScrollPosition;
  final _smallPreviewUpdateNotifier = ValueNotifier<LineChartSmallPreviewData>(
    LineChartSmallPreviewData(
      leftOffset: 0,
      previewWidthFraction: 0.35,
    ),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _datesScrollController.addListener(_datesScrollListener);
      _chartScrollController.addListener(_chartScrollListener);
      setState(() {
        datesMaxScrollPosition =
            _datesScrollController.position.maxScrollExtent + (chartViewPortSize.width - SpacingFoundation.horizontalSpacing32);
      });

      /// wait until chart is drawn to avoid exception _positions.isNotEmpty
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          if (datesMaxScrollPosition != null) {
            chartToSmallPreviewRatio = datesMaxScrollPosition! / (smallPreviewSize.width - 12);
            smallPreviewToChartRatio = (smallPreviewSize.width - 12) / datesMaxScrollPosition!;
          }
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

  Future<void> _animateChartToPosition(double position) async {
    setState(() => scrollingSmallPreview = true);
    await _chartScrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 250),
      curve: Curves.decelerate,
    );
    setState(() => scrollingSmallPreview = false);
  }

  void _scrollSmallPreviewToEnd() {
    final smallPreviewOffset =
        smallPreviewSize.width - (_smallPreviewUpdateNotifier.value.previewWidthFraction * smallPreviewSize.width);
    _smallPreviewUpdateNotifier.value = _smallPreviewUpdateNotifier.value.copyWith(leftOffset: smallPreviewOffset);
  }

  @override
  dispose() {
    _datesScrollController.dispose();
    _smallPreviewUpdateNotifier.dispose();
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
              }
              double offset = _chartScrollController.offset;
              if (offset <= _datesScrollController.position.maxScrollExtent) {
                _datesScrollController.jumpTo(offset);
              } else if (offset > _datesScrollController.position.maxScrollExtent &&
                  _datesScrollController.offset < _datesScrollController.position.maxScrollExtent) {
                _datesScrollController.jumpTo(_datesScrollController.position.maxScrollExtent);
              }
              if (_chartScrollController.offset == _chartScrollController.position.maxScrollExtent) {
                _scrollSmallPreviewToEnd();
              } else if (!scrollingSmallPreview) {
                final smallPreviewOffset = offset * smallPreviewToChartRatio;
                final scrollingRightToLeft = _chartScrollController.position.userScrollDirection == ScrollDirection.reverse;
                final shouldScrollFromStart = scrollingRightToLeft && _smallPreviewUpdateNotifier.value.leftOffset == 0;
                if (smallPreviewOffset <= (smallPreviewSize.width * 0.65) &&
                    (_smallPreviewUpdateNotifier.value.leftOffset > 0 || shouldScrollFromStart)) {
                  _smallPreviewUpdateNotifier.value = _smallPreviewUpdateNotifier.value.copyWith(
                    leftOffset: smallPreviewOffset,
                  );
                }
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
            child: ListView.separated(
              padding: EdgeInsets.zero,
              controller: _datesScrollController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
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
          SpacingFoundation.verticalSpace4,
          Align(
            alignment: Alignment.bottomCenter,
            child: UiKitLineChartSmallPreview(
              smallPreviewUpdateNotifier: _smallPreviewUpdateNotifier,
              chartItems: widget.chartData.items,
              size: smallPreviewSize,
              onScroll: (offset) {
                if (offset.isInfinite) {
                  _animateChartToPosition(_chartScrollController.position.maxScrollExtent);
                  return;
                }
                setState(() => scrollingSmallPreview = true);
                final chartOffset = offset * chartToSmallPreviewRatio;
                if (offset == 0) {
                  _animateChartToPosition(0);
                } else {
                  _chartScrollController.jumpTo(chartOffset);
                }
                setState(() => scrollingSmallPreview = false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
