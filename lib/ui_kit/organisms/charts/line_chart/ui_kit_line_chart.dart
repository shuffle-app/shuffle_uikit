import 'dart:math';

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

  bool scrollingDates = false;
  bool scrollingChart = false;
  bool scrollingSmallPreview = false;
  final _smallPreviewLeftOffsetNotifier = ValueNotifier<double>(8);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _datesScrollController.addListener(_datesScrollListener);
      _chartScrollController.addListener(_chartScrollListener);
      setState(() {
        chartToSmallPreviewRatio = _chartScrollController.position.maxScrollExtent / smallPreviewSize.width;
      });
    });
  }

  Future<void> _chartScrollListener() async {
    final atScrollEnd = _chartScrollController.offset == _chartScrollController.position.maxScrollExtent;
    if (atScrollEnd) {
      await _datesScrollController.animateTo(
        _chartScrollController.offset,
        duration: const Duration(milliseconds: 250),
        curve: Curves.decelerate,
      );
    }
  }

  Future<void> _datesScrollListener() async {
    final atScrollEnd = _datesScrollController.offset == _datesScrollController.position.maxScrollExtent;
    if (atScrollEnd) {
      await _chartScrollController.animateTo(
        _datesScrollController.offset,
        duration: const Duration(milliseconds: 250),
        curve: Curves.decelerate,
      );
    }
  }

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
                if (_chartScrollController.offset >= _chartScrollController.position.maxScrollExtent &&
                    _datesScrollController.offset < _datesScrollController.position.maxScrollExtent) {
                  _datesScrollController.jumpTo(_datesScrollController.position.maxScrollExtent);
                }
                scrollingChart = false;
              } else if (notification is ScrollStartNotification) {
                scrollingChart = true;
              }
              double offset = _chartScrollController.offset;
              if (!scrollingDates) {
                if (offset > _datesScrollController.position.maxScrollExtent) {
                  offset = _datesScrollController.position.maxScrollExtent;
                }

                _datesScrollController.jumpTo(offset);
                if (!scrollingSmallPreview) _smallPreviewLeftOffsetNotifier.value = max(8, offset / chartToSmallPreviewRatio);
              }
              return false;
            },
            child: UiKitLineChartBody(
              scrollController: _chartScrollController,
              availableSize: chartViewPortSize,
              chartItems: widget.chartData.items,
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
                }
                double offset = _datesScrollController.offset;
                if (!scrollingChart) {
                  if (offset > _chartScrollController.position.maxScrollExtent) {
                    offset = _chartScrollController.position.maxScrollExtent;
                  }
                  _chartScrollController.jumpTo(offset);
                  if (!scrollingSmallPreview) _smallPreviewLeftOffsetNotifier.value = max(8, offset / chartToSmallPreviewRatio);
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
                    DateFormat('MMM d').format(date),
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
                setState(() {
                  scrollingSmallPreview = true;
                });
                _chartScrollController.jumpTo(offset + (offset * chartToSmallPreviewRatio));
              },
            ),
          ),
        ],
      ),
    );
  }
}
