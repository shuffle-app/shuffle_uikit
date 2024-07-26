import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
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

  int get datesFitInChartViewPortCount => (chartViewPortSize.width / initialPixelsPerDate).floor();

  Size get viewPortComputedSize => Size(
        1.sw - SpacingFoundation.horizontalSpacing32,
        1.sw - (smallScreen ? SpacingFoundation.zero : SpacingFoundation.horizontalSpacing4),
      );

  Size get chartViewPortSize => Size(
        viewPortComputedSize.width - SpacingFoundation.verticalSpacing32,
        viewPortComputedSize.height * 0.45,
      );

  Size get smallPreviewSize => Size(
        chartViewPortSize.width,
        chartViewPortSize.width * 0.15,
      );

  double get additionalSpacingForDate {
    final spacePerDate =
        (_chartScrollController.position.maxScrollExtent * _smallPreviewUpdateNotifier.value.previewWidthFraction) /
            dates.length;
    double result = spacePerDate - initialPixelsPerDate;
    if (initialPixelsPerDate > spacePerDate) {
      result = initialPixelsPerDate - spacePerDate;
    }
    return result * 0.75;
  }

  List<DateTime> get dates {
    if (shrinkDates) {
      if (_smallPreviewUpdateNotifier.value.previewWidthFraction >= 0.99) {
        return widget.chartData.items.getNDates(datesFitInChartViewPortCount);
      }
      final width =
          _chartScrollController.position.maxScrollExtent * (_smallPreviewUpdateNotifier.value.previewWidthFraction);
      final displayableDatesCount = math.min(width ~/ initialPixelsPerDate, widget.chartData.items.dates.length - 1);

      return widget.chartData.items.getNDates(displayableDatesCount);
    }

    return widget.chartData.items.dates;
  }

  double chartToSmallPreviewRatio = 1;

  late double initialPixelsPerDate;

  double? initialPreviewWidthFraction;

  bool get shrinkDates {
    if (initialPreviewWidthFraction != null) {
      return _smallPreviewUpdateNotifier.value.previewWidthFraction > initialPreviewWidthFraction!;
    }
    return false;
  }

  bool get expandDates {
    if (initialPreviewWidthFraction != null) {
      return _smallPreviewUpdateNotifier.value.previewWidthFraction < initialPreviewWidthFraction!;
    }
    return false;
  }

  double? maxChartScrollablePartWidth;
  final _smallPreviewUpdateNotifier = ValueNotifier<LineChartSmallPreviewData>(
    LineChartSmallPreviewData(
      leftOffset: 0,
      previewWidthFraction: 0.35,
    ),
  );
  final _tapNotifier = ValueNotifier<Offset>(Offset.zero);
  final _selectedDataSetNotifier = ValueNotifier<LineChartSelectedPointData>(LineChartSelectedPointData.empty());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _datesScrollController.addListener(_datesScrollListener);
      _chartScrollController.addListener(_chartScrollListener);
      setState(() {
        maxChartScrollablePartWidth = _datesScrollController.position.maxScrollExtent +
            (chartViewPortSize.width - SpacingFoundation.horizontalSpacing24);
        initialPreviewWidthFraction = chartViewPortSize.width / maxChartScrollablePartWidth!;
        _smallPreviewUpdateNotifier.value = _smallPreviewUpdateNotifier.value.copyWith(
          previewWidthFraction: initialPreviewWidthFraction,
        );
      });

      /// wait until chart is drawn to avoid exception _positions.isNotEmpty
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          if (maxChartScrollablePartWidth != null) {
            maxChartScrollablePartWidth = _datesScrollController.position.maxScrollExtent +
                chartViewPortSize.width -
                SpacingFoundation.horizontalSpacing32;
            chartToSmallPreviewRatio = maxChartScrollablePartWidth! / (smallPreviewSize.width);
            initialPixelsPerDate = (maxChartScrollablePartWidth! -
                    ((widget.chartData.items.dates.length - 1) * SpacingFoundation.horizontalSpacing10)) /
                widget.chartData.items.dates.length;
            _smallPreviewUpdateNotifier.addListener(_smallPreviewUpdateListener);
          }
        });
        log('datesMaxScrollPosition: $maxChartScrollablePartWidth');
        log('chartToSmallPreviewRatio: $chartToSmallPreviewRatio');
        log('_chartScrollController.position.maxScrollExtent: ${_chartScrollController.position.maxScrollExtent}');
        log('_datesScrollController.position.maxScrollExtent: ${_datesScrollController.position.maxScrollExtent + chartViewPortSize.width}');
      });
    });
  }

  Future<void> _chartScrollListener() async {}

  Future<void> _datesScrollListener() async {}

  void _smallPreviewUpdateListener() {
    setState(() {
      chartToSmallPreviewRatio = (_datesScrollController.position.maxScrollExtent) / smallPreviewSize.width;
    });
  }

  Future<void> _animateChartToPosition(double position) async {
    await _chartScrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 250),
      curve: Curves.decelerate,
    );
  }

  Future<void> _animateDatesToPosition(double position) async {
    await _datesScrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 250),
      curve: Curves.decelerate,
    );
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
                  widget.chartData.chartTitle,
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
          maxChartScrollablePartWidth == null || initialPreviewWidthFraction == null
              ? SizedBox.fromSize(size: chartViewPortSize, child: const LoadingWidget())
              : UiKitLineChartBody(
                  initialPreviewWidthFraction: initialPreviewWidthFraction!,
                  initialRatioWidth: chartToSmallPreviewRatio,
                  tapNotifier: _tapNotifier,
                  scrollController: _chartScrollController,
                  selectedDataSetNotifier: _selectedDataSetNotifier,
                  availableSize: chartViewPortSize,
                  chartItems: widget.chartData.items,
                  datesMaxScrollPosition: maxChartScrollablePartWidth,
                  smallPreviewUpdateNotifier: _smallPreviewUpdateNotifier,
                ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
          SpacingFoundation.verticalSpace2,
          SizedBox(
            width: viewPortComputedSize.width,
            height: viewPortComputedSize.height * 0.06,
            child: AnimatedBuilder(
              animation: _smallPreviewUpdateNotifier,
              builder: (context, child) {
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  controller: _datesScrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  addAutomaticKeepAlives: false,
                  separatorBuilder: (context, index) {
                    double spacing = SpacingFoundation.horizontalSpacing8;
                    if (expandDates) {
                      spacing = additionalSpacingForDate;
                    }

                    return spacing.widthBox;
                  },
                  itemBuilder: (context, index) {
                    final date = dates.elementAt(index);

                    return Text(
                      DateFormat('MMMd', Localizations.localeOf(context).languageCode).format(date),
                      style: regularTextTheme?.caption2.copyWith(color: ColorsFoundation.neutral40),
                    );
                  },
                  itemCount: dates.length,
                );
              },
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
                  _animateDatesToPosition(_datesScrollController.position.maxScrollExtent);
                  return;
                }
                final chartOffset = offset * chartToSmallPreviewRatio;
                if (offset == 0) {
                  _animateChartToPosition(0);
                  _animateDatesToPosition(0);
                } else {
                  _chartScrollController.jumpTo(chartOffset);
                  _datesScrollController.jumpTo(chartOffset);
                }
              },
            ),
          ),
          SpacingFoundation.verticalSpace12,
          Wrap(
            runSpacing: SpacingFoundation.verticalSpacing8,
            spacing: SpacingFoundation.horizontalSpacing8,
            children: widget.chartData.items
                .map(
                  (e) => UiKitColoredLegendChip(
                    text: e.chartItemName,
                    color: e.color,
                    gradient: e.gradient,
                  ),
                )
                .toList(),
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
        ],
      ),
    );
  }
}
