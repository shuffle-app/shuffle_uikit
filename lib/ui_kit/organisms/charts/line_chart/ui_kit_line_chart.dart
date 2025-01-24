import 'dart:math' as math;
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/organisms/charts/line_chart/ui_kit_line_chart_body.dart';
import 'package:shuffle_uikit/ui_kit/organisms/charts/line_chart/ui_kit_line_chart_small_preview.dart';
import 'package:shuffle_uikit/ui_models/charts/line_chart_small_preview_data.dart';

class UiKitLineChart extends StatefulWidget {
  final UiKitLineChartData<num> chartData;
  final UiKitLineChartAdditionalData? chartAdditionalData;
  final ValueChanged<String>? popUpMenuItemSelected;
  final VoidCallback? action;
  final bool loading;
  final double? customHorizontalPadding;

  const UiKitLineChart({
    super.key,
    required this.chartData,
    this.chartAdditionalData,
    this.popUpMenuItemSelected,
    this.action,
    this.loading = false,
    this.customHorizontalPadding,
  });

  @override
  State<UiKitLineChart> createState() => _UiKitLineChartState();
}

class _UiKitLineChartState extends State<UiKitLineChart> {
  final ScrollController _datesScrollController = ScrollController();
  final ScrollController _chartScrollController = ScrollController();
  final bool smallScreen = 1.sw <= 380;
  double chartToSmallPreviewRatio = 1;
  double? initialPreviewWidthFraction;
  late double initialPixelsPerDate;
  double? initialMaxChartScrollablePartWidth;
  late final _smallPreviewUpdateNotifier = ValueNotifier<LineChartSmallPreviewData>(
    LineChartSmallPreviewData(
      leftOffset: 0,
      previewWidthFraction: 0.35,
      visibleLinesIds: widget.chartData.items.map((e) => e.id).toList(),
    ),
  );
  final _tapNotifier = ValueNotifier<Offset>(Offset.zero);
  final _bodySizingNotifier = ValueNotifier<UiKitBodySizingInfo>(UiKitBodySizingInfo.initial());
  final _selectedDataSetNotifier = ValueNotifier<LineChartSelectedPointData>(LineChartSelectedPointData.empty());
  late final _visibleDateRangeNotifier = ValueNotifier<DateRange>(widget.chartData.items.period);

  List<int> get visibleLineIds => _smallPreviewUpdateNotifier.value.visibleLinesIds;

  int get datesFitInChartViewPortCount => chartViewPortSize.width ~/ initialPixelsPerDate;

  // int get datesFitInChartViewPortCount => (chartViewPortSize.width / initialPixelsPerDate).floor();

  double get datesMaxScrollWidth => _datesScrollController.position.maxScrollExtent;

  // double get datesMaxScrollWidth => _datesScrollController.position.maxScrollExtent + chartViewPortSize.width;

  double get chartMaxScrollWidth => chartPointsStep * widget.chartData.items.maxDatasetsCount;

  Size get viewPortComputedSize => Size(
        1.sw - SpacingFoundation.horizontalSpacing32,
        1.sw - (smallScreen ? SpacingFoundation.zero : SpacingFoundation.horizontalSpacing4),
      );

  Size get chartViewPortSize => Size(
        viewPortComputedSize.width - (widget.customHorizontalPadding ?? SpacingFoundation.verticalSpacing32),
        viewPortComputedSize.height * 0.45,
      );

  Size get smallPreviewSize => Size(
        chartViewPortSize.width,
        chartViewPortSize.width * 0.15,
      );

  double get smallPreviewWidth => smallPreviewSize.width * _smallPreviewUpdateNotifier.value.previewWidthFraction;

  double get additionalSpacingForDate {
    final spacePerDate = (chartMaxScrollWidth * _smallPreviewUpdateNotifier.value.previewWidthFraction) / dates.length;
    double result = spacePerDate - initialPixelsPerDate;
    if (initialPixelsPerDate > spacePerDate) {
      result = initialPixelsPerDate - spacePerDate;
    }
    return result * (1 - datesSpacingExpansionFraction);
  }

  List<DateTime> get dates {
    if (widget.chartData.items.isEmpty) return [];
    List<DateTime> datesToReturn = widget.chartData.items.dates;
    if (shrinkDates) {
      if (_smallPreviewUpdateNotifier.value.previewWidthFraction >= 0.99) {
        datesToReturn = widget.chartData.items.getNDates(datesFitInChartViewPortCount);
        return datesToReturn;
      }
      final width = chartMaxScrollWidth * (_smallPreviewUpdateNotifier.value.previewWidthFraction);
      int displayableDatesCount = math.max(
        maxDisplayableDatesCount,
        widget.chartData.items.dates.length -
            math.min(width ~/ initialPixelsPerDate, widget.chartData.items.dates.length).toInt(),
      );

      datesToReturn = widget.chartData.items.getNDates(displayableDatesCount);
    }

    return datesToReturn;
  }

  int get maxDisplayableDatesCount =>
      (datesVisibleInViewport / (_smallPreviewUpdateNotifier.value.previewWidthFraction * 1.05)).ceil();

  // int get maxDisplayableDatesCount => (chartMaxScrollWidth / (initialPixelsPerDate * datesSpacingExpansionFraction)).ceil();

  bool get shrinkDates {
    if (initialPreviewWidthFraction != null && _chartScrollController.hasClients) {
      return _smallPreviewUpdateNotifier.value.previewWidthFraction > initialPreviewWidthFraction!;
    }
    return false;
  }

  // bool get expandDates {
  //   if (initialPreviewWidthFraction != null) {
  //     return _smallPreviewUpdateNotifier.value.previewWidthFraction < initialPreviewWidthFraction!;
  //   }
  //   return false;
  // }

  double get datesSpacingExpansionFraction {
    return _smallPreviewUpdateNotifier.value.previewWidthFraction / (initialPreviewWidthFraction ?? 0.35);
  }

  double get chartPointsStep {
    if (_smallPreviewUpdateNotifier.value.previewWidthFraction >= 0.99) {
      return (initialMaxChartScrollablePartWidth ?? chartViewPortSize.width) /
          (widget.chartData.items.maxDatasetsCount);
    }

    return (initialMaxChartScrollablePartWidth ?? chartViewPortSize.width) /
        (widget.chartData.items.maxDatasetsCount - 1);
  }

  int get datesVisibleInViewport {
    /// returns number of dates that can be displayed in the viewport
    // final visibleDatesCount = (chartViewPortSize.width / (initialPixelsPerDate + additionalSpacingForDate)).toInt();
    // if(visibleDatesCount == 0){
    return datesFitInChartViewPortCount;
    // }
    // return visibleDatesCount;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initChartLines().then((_) {
        if (mounted) {
          final visibleLinesIds = widget.chartData.items.map((e) => e.id).toList();
          _smallPreviewUpdateNotifier.value = _smallPreviewUpdateNotifier.value.copyWith(
            visibleLinesIds: visibleLinesIds,
          );
        }
      });
    });
  }

  @override
  void didUpdateWidget(covariant UiKitLineChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initChartLines();
    });
  }

  _initChartLines() async {
    if (!mounted) return;
    if (widget.chartData.items.isEmpty) {
      _smallPreviewUpdateNotifier.value = LineChartSmallPreviewData(
        leftOffset: 0,
        previewWidthFraction: 1,
        visibleLinesIds: [],
      );
      initialMaxChartScrollablePartWidth = viewPortComputedSize.width;
      initialPreviewWidthFraction = 0.35;
      initialPixelsPerDate = 1;
      setState(() {});
      return;
    }

    /// wait until chart is drawn to avoid exception _positions.isNotEmpty
    await Future.delayed(const Duration(milliseconds: 500), () {
      initialMaxChartScrollablePartWidth = datesMaxScrollWidth - SpacingFoundation.horizontalSpacing32;
      initialPreviewWidthFraction = (chartViewPortSize.width / initialMaxChartScrollablePartWidth!).clamp(0.1, 1);
      _smallPreviewUpdateNotifier.value = _smallPreviewUpdateNotifier.value.copyWith(
        previewWidthFraction: min(1, initialPreviewWidthFraction!),
        visibleLinesIds: visibleLineIds,
      );
      if (initialMaxChartScrollablePartWidth != null) {
        initialMaxChartScrollablePartWidth = datesMaxScrollWidth - SpacingFoundation.horizontalSpacing32;
        chartToSmallPreviewRatio = initialMaxChartScrollablePartWidth! / (smallPreviewSize.width);
        initialPixelsPerDate = (initialMaxChartScrollablePartWidth! -
                ((widget.chartData.items.dates.length - 1) * SpacingFoundation.horizontalSpacing8)) /
            widget.chartData.items.dates.length;
        _smallPreviewUpdateNotifier.addListener(_smallPreviewUpdateListener);
      }

      final visibleDates = (chartViewPortSize.width ~/ initialPixelsPerDate) - 1;
      DateRange dateRange = DateRange(
        start: widget.chartData.items.earliestDate,
        end: widget.chartData.items.latestDate,
      );

      /// check if dates are not empty to avoid exception
      if (dates.isNotEmpty) {
        dateRange = DateRange(
          start: dates.first,
          end: visibleDates - 1 < dates.length ? dates.elementAt(max(0, visibleDates - 1)) : dates.last,
        );
      }
      _visibleDateRangeNotifier.value = dateRange;
      setState(() {});
    });
  }

  double get chartStepScaleFactor =>
      (initialPreviewWidthFraction ?? 0.35) / (_smallPreviewUpdateNotifier.value.previewWidthFraction * 1.05);

  double get maxChartScrollablePartWidth => _smallPreviewUpdateNotifier.value.previewWidthFraction >= 0.99
      ? chartViewPortSize.width
      : chartMaxScrollWidth * chartStepScaleFactor;

  void _smallPreviewUpdateListener() {
    if (!mounted) return;
    if (_chartScrollController.positions.isEmpty) return;
    double? additionalWidth;
    if (_smallPreviewUpdateNotifier.value.previewWidthFraction < (initialPreviewWidthFraction ?? 0.35)) {
      /// taking [datesMaxScrollWidth] as a reference to calculate additional width
      /// because dates scroll width is bigger than chart scroll width in this case
      double datesWidth = datesMaxScrollWidth;
      if (initialMaxChartScrollablePartWidth! > datesWidth) {
        datesWidth = initialMaxChartScrollablePartWidth!;
      }
      additionalWidth =
          datesWidth - (2 * datesSpacingExpansionFraction * initialPixelsPerDate) - initialMaxChartScrollablePartWidth!;

      chartToSmallPreviewRatio = datesWidth / (smallPreviewSize.width);
    } else {
      /// need to pass negative value to make chart smaller
      // final width = chartViewPortSize.width + (chartMaxScrollWidth - chartViewPortSize.width);
      additionalWidth = chartViewPortSize.width - chartMaxScrollWidth;
      chartToSmallPreviewRatio = smallPreviewSize.width / smallPreviewWidth;
    }
    if (_smallPreviewUpdateNotifier.value.previewWidthFraction == initialPreviewWidthFraction) {
      chartToSmallPreviewRatio = (initialMaxChartScrollablePartWidth ?? 0) / smallPreviewSize.width;
      additionalWidth = 0;
    }
    _bodySizingNotifier.value = _bodySizingNotifier.value.copyWith(
      additionalWidth: additionalWidth,
    );
    setState(() {});
    _setVisibleDateRange();
  }

  void _setVisibleDateRange() {
    if (!mounted) return;
    if (_chartScrollController.positions.isEmpty) return;

    final List<DateTime> allDates = widget.chartData.items.dates;

    final int visibleDatesLength = (_smallPreviewUpdateNotifier.value.previewWidthFraction * allDates.length).toInt();

    final leftOffsetRatio = _smallPreviewUpdateNotifier.value.leftOffset / smallPreviewWidth;

    final int leftUnvisibleDatesLength = (visibleDatesLength * leftOffsetRatio).toInt();

    final DateTime startDate = allDates.elementAt(leftUnvisibleDatesLength);
    final DateTime endDate =
        allDates.elementAt(min(allDates.length - 1, leftUnvisibleDatesLength + visibleDatesLength));

    _visibleDateRangeNotifier.value = DateRange(start: startDate, end: endDate);
  }

  Future<void> _scrollChartToPosition(double position) async {
    double datesScrollPosition = 0;
    double chartScrollPosition = 0;
    if (position.isInfinite) return;
    final animate = position.isInfinite || position == 0;

    datesScrollPosition = math.min(
      _datesScrollController.position.maxScrollExtent,
      position.isNaN ? 0 : position * chartToSmallPreviewRatio,
    );
    chartScrollPosition = math.min(
      maxChartScrollablePartWidth,
      // _chartScrollController.position.maxScrollExtent,
      position.isNaN ? 0 : position * chartToSmallPreviewRatio,
    );

    if (animate || position.isNaN) {
      await Future.wait([
        _datesScrollController.animateTo(
          datesScrollPosition,
          duration: const Duration(milliseconds: 250),
          curve: Curves.decelerate,
        ),
        _chartScrollController.animateTo(
          chartScrollPosition,
          duration: const Duration(milliseconds: 250),
          curve: Curves.decelerate,
        ),
      ]);
    } else {
      _datesScrollController.jumpTo(datesScrollPosition);
      _chartScrollController.jumpTo(chartScrollPosition);
    }
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
    final colorScheme = context.uiKitTheme?.colorScheme;

    return UiKitCardWrapper(
      width: viewPortComputedSize.width,
      borderRadius: BorderRadiusFoundation.all24,
      color: colorScheme?.surface3,
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
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.chartData.chartTitle,
                        style: boldTextTheme?.caption2Medium,
                      ),
                      if (widget.chartData.subtitle != null)
                        TextSpan(
                          text: '\n${widget.chartData.subtitle}',
                          style: boldTextTheme?.body,
                        )
                    ],
                  ),
                ),
              ),
              SpacingFoundation.horizontalSpace4,
              if (!widget.loading)
                ValueListenableBuilder(
                  valueListenable: _visibleDateRangeNotifier,
                  builder: (context, range, child) {
                    final text =
                        '${DateFormat('MMM d').format(_visibleDateRangeNotifier.value.start)} - ${DateFormat('MMM d').format(_visibleDateRangeNotifier.value.end)}';
                    return SizedBox(
                      width: 0.36.sw,
                      child: AutoSizeText(
                        text,
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.mutedText),
                      ),
                    );
                  },
                ),
              if (widget.action != null)
                context
                    .iconButtonNoPadding(
                      data: BaseUiKitButtonData(
                        iconInfo: BaseUiKitButtonIconData(
                          iconData: ShuffleUiKitIcons.chevronright,
                        ),
                        onPressed: widget.action,
                        backgroundColor: colorScheme?.surface3,
                      ),
                    )
                    .paddingOnly(left: EdgeInsetsFoundation.horizontal12),
              if (widget.chartData.popUpMenuOptions != null)
                PopupMenuButton<String>(
                  onSelected: widget.popUpMenuItemSelected,
                  padding: EdgeInsets.zero,
                  position: PopupMenuPosition.over,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusFoundation.all16,
                  ),
                  icon: Icon(
                    Icons.more_vert,
                    color: colorScheme?.inverseSurface,
                  ),
                  itemBuilder: (context) => widget.chartData.popUpMenuOptions!
                      .map<PopupMenuItem<String>>(
                        (option) => PopupMenuItem(
                          onTap: () => widget.popUpMenuItemSelected?.call(option),
                          child: Text(
                            option,
                            style: boldTextTheme?.caption2Medium.copyWith(color: colorScheme?.inverseBodyTypography),
                          ),
                        ),
                      )
                      .toList(),
                ),
            ],
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
          SpacingFoundation.verticalSpace16,
          initialMaxChartScrollablePartWidth == null || initialPreviewWidthFraction == null || widget.loading
              ? SizedBox.fromSize(
                  size: chartViewPortSize,
                  child: Center(child: CircularProgressIndicator(color: colorScheme?.inverseSurface)),
                )
              : UiKitLineChartBody(
                  bodySizingNotifier: _bodySizingNotifier,
                  initialPreviewWidthFraction: initialPreviewWidthFraction!,
                  initialRatioWidth: chartToSmallPreviewRatio,
                  tapNotifier: _tapNotifier,
                  scrollController: _chartScrollController,
                  selectedDataSetNotifier: _selectedDataSetNotifier,
                  availableSize: chartViewPortSize,
                  chartItems: widget.chartData.items,
                  datesMaxScrollPosition: initialMaxChartScrollablePartWidth,
                  smallPreviewUpdateNotifier: _smallPreviewUpdateNotifier,
                ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
          SpacingFoundation.verticalSpace2,
          if (!widget.chartData.isEmpty)
            SizedBox(
              width: viewPortComputedSize.width,
              height: viewPortComputedSize.height * 0.06,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                controller: _datesScrollController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                addAutomaticKeepAlives: false,
                separatorBuilder: (context, index) {
                  return SpacingFoundation.horizontalSpace8;
                  // double spacing = SpacingFoundation.horizontalSpacing8;
                  // if (shrinkDates) {
                  //   spacing += additionalSpacingForDate;
                  // }
                  //
                  // return spacing.widthBox;
                },
                itemBuilder: (context, index) {
                  final date = dates.elementAt(index);

                  return Text(
                    DateFormat('MMMd', Localizations.localeOf(context).languageCode).format(date),
                    style: regularTextTheme?.caption2.copyWith(color: ColorsFoundation.neutral40),
                  );
                },
                itemCount: dates.length,
              ),
            ),
          SpacingFoundation.verticalSpace4,
          if (!widget.loading)
            Align(
              alignment: Alignment.bottomCenter,
              child: UiKitLineChartSmallPreview(
                  smallPreviewUpdateNotifier: _smallPreviewUpdateNotifier,
                  chartItems: widget.chartData.items,
                  size: smallPreviewSize,
                  onScroll: _scrollChartToPosition,
                  initialPreviewWidthFraction: initialPreviewWidthFraction),
            ),
          SpacingFoundation.verticalSpace12,
          if (!widget.loading)
            Wrap(
              runSpacing: SpacingFoundation.verticalSpacing8,
              spacing: SpacingFoundation.horizontalSpacing8,
              children: widget.chartData.items
                  .map(
                    (e) => UiKitColoredLegendChip(
                      text: e.chartItemName,
                      color: e.color,
                      gradient: e.gradient,
                      icon: e.icon,
                      selected: visibleLineIds.contains(e.id),
                      onTap: () {
                        final ids = visibleLineIds;
                        if (ids.contains(e.id)) {
                          ids.remove(e.id);
                        } else {
                          ids.add(e.id);
                        }
                        _smallPreviewUpdateNotifier.value = _smallPreviewUpdateNotifier.value.copyWith(
                          visibleLinesIds: ids,
                        );
                      },
                    ),
                  )
                  .toList(),
            ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16).paddingOnly(
                bottom: widget.chartAdditionalData != null && widget.chartAdditionalData!.isNotEmpty
                    ? EdgeInsetsFoundation.zero
                    : EdgeInsetsFoundation.vertical16),
          if (widget.chartAdditionalData != null && widget.chartAdditionalData!.isNotEmpty && !widget.loading)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chartAdditionalData!.title,
                  style: boldTextTheme?.caption2Medium,
                ),
                SpacingFoundation.verticalSpace4,
                ...widget.chartAdditionalData!.dataItems.map<Widget>(
                  (item) => UiKitLineChartAdditionalDataItemWidget(
                    title: item.mask,
                    dataItems: item.groupedValues,
                    maxWidth: viewPortComputedSize.width - EdgeInsetsFoundation.all32,
                  ),
                ),
                SpacingFoundation.verticalSpace12,
                ClipRRect(
                  borderRadius: BorderRadiusFoundation.max,
                  child: Divider(
                    color: colorScheme?.surface4,
                    thickness: 2,
                    height: 2,
                  ),
                ),
                SpacingFoundation.verticalSpace12,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: widget.chartAdditionalData!.dataItems.uniqueGroups.map<Widget>(
                    (group) {
                      final isLast = widget.chartAdditionalData!.dataItems.uniqueGroups.last.name == group.name;
                      final value = widget.chartAdditionalData!.dataItems.groupPercentage(group.name);
                      final color = group.color;

                      return Expanded(
                        child: UiKitLineChartTitledStat(
                          title: group.mask,
                          color: color,
                          value: '${value.toStringAsFixed(1)}%',
                        ).paddingOnly(right: isLast ? EdgeInsetsFoundation.zero : EdgeInsetsFoundation.horizontal2),
                      );
                    },
                  ).toList(),
                ),
              ],
            ).paddingAll(EdgeInsetsFoundation.all16),
        ],
      ),
    );
  }
}
