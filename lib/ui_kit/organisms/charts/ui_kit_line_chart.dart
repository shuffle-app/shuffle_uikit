import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/molecules/decoration/dashed_divider.dart';
import 'package:shuffle_uikit/ui_kit/organisms/charts/painters/line_chart_painters.dart';
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
    // if (!scrollingChart) {
    //   setState(() {
    //     scrollingChart = true;
    //     scrollingDates = false;
    //   });
    // }
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
    // if (!scrollingDates) {
    //   setState(() {
    //     scrollingDates = true;
    //     scrollingChart = false;
    //   });
    // }
  }

  @override
  dispose() {
    _datesScrollController.dispose();
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
              if (!scrollingDates) {
                double offset = _chartScrollController.offset;
                print(offset);
                if (offset > _datesScrollController.position.maxScrollExtent) {
                  offset = _datesScrollController.position.maxScrollExtent;
                }

                _datesScrollController.jumpTo(offset);
              }
              return false;
            },
            child: _UiKitLineChartBody(
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
                if (!scrollingChart) {
                  double offset = _datesScrollController.offset;
                  if (offset > _chartScrollController.position.maxScrollExtent) {
                    offset = _chartScrollController.position.maxScrollExtent;
                  }
                  _chartScrollController.jumpTo(offset);
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
            child: _UiKitLineChartSmallPreview(
              chartItems: widget.chartData.items,
              size: smallPreviewSize,
              onScroll: (offset) {
                _chartScrollController.jumpTo(offset * chartToSmallPreviewRatio);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _UiKitLineChartBody extends StatelessWidget {
  final Size availableSize;
  final List<UiKitLineChartItemData<num>> chartItems;
  final ScrollController? scrollController;

  const _UiKitLineChartBody({
    Key? key,
    required this.availableSize,
    required this.chartItems,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return SizedBox(
      width: availableSize.width,
      height: availableSize.height + SpacingFoundation.verticalSpacing16,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            top: -2,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chartItems.maxValue.toStringAsFixed(0),
                  style: regularTextTheme?.caption2.copyWith(color: ColorsFoundation.mutedText),
                ),
                DashedDivider(color: ColorsFoundation.darkNeutral900, availableWidth: availableSize.width),
                SpacingFoundation.verticalSpace16,
                ...chartItems.medianValues(((availableSize.height ~/ SpacingFoundation.verticalSpacing16) ~/ 2) - 2).map(
                      (e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DashedDivider(color: ColorsFoundation.darkNeutral900, availableWidth: availableSize.width),
                          Text(
                            e,
                            style: regularTextTheme?.caption2.copyWith(color: ColorsFoundation.mutedText),
                          ),
                          DashedDivider(color: ColorsFoundation.darkNeutral900, availableWidth: availableSize.width),
                          SpacingFoundation.verticalSpace16,
                        ],
                      ),
                    ),
                DashedDivider(color: ColorsFoundation.darkNeutral900, availableWidth: availableSize.width),
                Text(
                  chartItems.minValue.toStringAsFixed(0),
                  style: regularTextTheme?.caption2.copyWith(color: ColorsFoundation.mutedText),
                ),
                DashedDivider(color: ColorsFoundation.darkNeutral900, availableWidth: availableSize.width),
              ],
            ),
          ),
          SizedBox(
            width: availableSize.width,
            height: availableSize.height + SpacingFoundation.verticalSpacing16,
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: CustomPaint(
                isComplex: true,
                willChange: false,
                size: Size(
                  chartItems.dates.length * (SpacingFoundation.horizontalSpacing32 * 2.5),
                  availableSize.height + SpacingFoundation.verticalSpacing16,
                ),
                painter: LineChartPainter(lines: chartItems),
              ).paddingOnly(left: EdgeInsetsFoundation.horizontal32),
            ),
          ),
        ],
      ),
    );
  }
}

class _UiKitLineChartSmallPreview extends StatelessWidget {
  final List<UiKitLineChartItemData<num>> chartItems;
  final Size size;
  final ValueChanged<double>? onScroll;

  const _UiKitLineChartSmallPreview({Key? key, required this.chartItems, required this.size, this.onScroll}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadiusFoundation.all4,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              left: SpacingFoundation.verticalSpacing12,
              child: CustomPaint(
                isComplex: true,
                willChange: false,
                size: size,
                painter: LineChartPainter(
                  lines: chartItems,
                  step: (size.width) / chartItems.maxDatasetsCount,
                ),
              ),
            ),
            _UiKitLineChartSmallPreviewOverlay(
              size: size,
              onScroll: onScroll,
            ),
          ],
        ),
      ),
    );
  }
}

class _UiKitLineChartSmallPreviewOverlay extends StatefulWidget {
  final Size size;
  final ValueChanged<double>? onScroll;

  const _UiKitLineChartSmallPreviewOverlay({
    Key? key,
    required this.size,
    this.onScroll,
  }) : super(key: key);

  @override
  State<_UiKitLineChartSmallPreviewOverlay> createState() => _UiKitLineChartSmallPreviewOverlayState();
}

class _UiKitLineChartSmallPreviewOverlayState extends State<_UiKitLineChartSmallPreviewOverlay> {
  final leftOffsetNotifier = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: widget.size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanUpdate: (details) {
              double newOffset = leftOffsetNotifier.value + details.delta.dx;
              if (newOffset <= 8) newOffset = 0;

              if (newOffset >= (widget.size.width * 0.65) - 8) {}
              leftOffsetNotifier.value = newOffset;
              widget.onScroll?.call(newOffset * 1.25);
            },
            child: AnimatedBuilder(
              animation: leftOffsetNotifier,
              builder: (context, child) => ClipPath(
                clipper: CropInnerAreaClipper(
                  Rect.fromLTWH(leftOffsetNotifier.value, 2, widget.size.width * 0.35, widget.size.height - 4),
                  4,
                ),
                child: child,
              ),
              child: ColoredBox(
                color: ColorsFoundation.neutral16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
