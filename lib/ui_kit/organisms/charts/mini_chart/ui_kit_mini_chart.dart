import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_models/charts/line_chart_small_preview_data.dart';

class UiKitMiniChart extends StatefulWidget {
  final List<UiKitMiniChartData> data;

  const UiKitMiniChart({
    super.key,
    required this.data,
  });

  @override
  State<UiKitMiniChart> createState() => _UiKitMiniChartState();
}

class _UiKitMiniChartState extends State<UiKitMiniChart> {
  final ScrollController _datesScrollController = ScrollController();
  double? datesToPreviewWidthRatio;

  Size get previewSize => Size(1.sw - 78, (1.sw - 72) * 0.15625);

  Size get datesViewPortSize => Size(
        previewSize.width,
        0.0281.sh,
      );

  double get pixelsPerDate => previewSize.width / widget.data.period.start.difference(widget.data.period.end).inDays;
  late final ValueNotifier<DateRange> _dateNotifier = ValueNotifier(DateRange(
    start: widget.data.period.start,
    end: widget.data.period.end,
  ));
  final ValueNotifier<LineChartSmallPreviewData> _previewUpdatesNotifier =
      ValueNotifier(LineChartSmallPreviewData.initial());
  final AutoSizeGroup _autoSizeGroup = AutoSizeGroup();

  @override
  void initState() {
    super.initState();
    final difference = widget.data.period.start.isAtSameMomentAs(widget.data.period.end)
        ? 0
        : widget.data.period.start.difference(widget.data.period.end).inDays;

    final visibleDatesCount = (difference * _previewUpdatesNotifier.value.previewWidthFraction).toInt().abs();
    WidgetsBinding.instance.addPostFrameCallback((time) => _dateNotifier.value = DateRange(
          start: widget.data.period.start,
          end: widget.data.period.start.add(Duration(days: visibleDatesCount.toInt())),
        ));
    // WidgetsBinding.instance.addPostFrameCallback((time) {
    //   datesToPreviewWidthRatio =
    //       (_datesScrollController.position.maxScrollExtent + datesViewPortSize.width) / previewSize.width;
    //   _previewUpdatesNotifier.addListener(_fractionListener);
    // });
  }

  // void _fractionListener() {
  //   final difference = widget.data.period.end.difference(widget.data.period.start).inDays;
  //   debugPrint('[UiKitMiniChart] difference $difference');
  //   final visibleDatesCount = difference * _previewUpdatesNotifier.value.previewWidthFraction;
  //   final offsetIndex = _previewUpdatesNotifier.value.leftOffset ~/ pixelsPerDate;
  //
  //   final newStart = widget.data.period.start.add(Duration(days: offsetIndex));
  //   final newEnd = newStart.add(Duration(days: visibleDatesCount.toInt() + 1));
  //
  //   _dateNotifier.value = DateRange(start: newStart, end: newEnd);
  // }

  @override
  void dispose() {
    _datesScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...widget.data.map<Widget>(
          (e) => UiKitMiniChartDataItemWidget(
            data: e,
            currentPeriodNotifier: _dateNotifier,
            textAutoSizeGroup: _autoSizeGroup,
          ).paddingSymmetric(vertical: EdgeInsetsFoundation.vertical4),
        ),
        // SpacingFoundation.verticalSpace8,

        //TODO understand what we need here and how would show it
        /// timeline
        // SizedBox.fromSize(
        //   size: datesViewPortSize,
        //   child: ListView.separated(
        //     padding: EdgeInsets.zero,
        //     controller: _datesScrollController,
        //     scrollDirection: Axis.horizontal,
        //     physics: const NeverScrollableScrollPhysics(),
        //     addAutomaticKeepAlives: false,
        //     separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace8,
        //     itemBuilder: (context, index) => Text(
        //       '${index.toStringAsFixed(0).padLeft(2, '0')}:00',
        //       style: regularTextTheme?.caption2.copyWith(color: ColorsFoundation.neutral40),
        //     ),
        //     itemCount: 24,
        //   ),
        // ),
        //
        // /// preview
        // UiKitSmallMultiLineChartPreview(
        //   previewUpdatesNotifier: _previewUpdatesNotifier,
        //   size: previewSize,
        //   linePainters:
        //       widget.data.map<CustomPainter>((e) => UiKitMiniChartPainter(data: e.items, color: e.color)).toList(),
        //   onScroll: (offsetValue) {
        //     final offset = offsetValue * (datesToPreviewWidthRatio ?? 1);
        //     if (offset.isInfinite) {
        //       _datesScrollController.animateTo(
        //         _datesScrollController.position.maxScrollExtent,
        //         duration: const Duration(milliseconds: 750),
        //         curve: Curves.decelerate,
        //       );
        //     } else if (offset.isNaN) {
        //       _datesScrollController.animateTo(
        //         0,
        //         duration: const Duration(milliseconds: 200),
        //         curve: Curves.decelerate,
        //       );
        //     } else {
        //       _datesScrollController.jumpTo(offset);
        //     }
        //   },
        // ),
      ],
    );
  }
}
