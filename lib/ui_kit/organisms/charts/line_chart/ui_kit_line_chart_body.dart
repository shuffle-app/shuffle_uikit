import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/molecules/decoration/dashed_divider.dart';
import 'package:shuffle_uikit/ui_models/charts/line_chart_small_preview_data.dart';

class UiKitLineChartBody extends StatelessWidget {
  final Size availableSize;
  final List<UiKitLineChartItemData<num>> chartItems;
  final ScrollController scrollController;
  final double? datesMaxScrollPosition;
  final ValueNotifier<Offset> tapNotifier;
  final ValueNotifier<UiKitBodySizingInfo> bodySizingNotifier;
  final ValueNotifier<LineChartSelectedPointData> selectedDataSetNotifier;
  final ValueNotifier<LineChartSmallPreviewData> smallPreviewUpdateNotifier;
  final double initialRatioWidth;
  final double initialPreviewWidthFraction;

  const UiKitLineChartBody({
    super.key,
    required this.availableSize,
    required this.chartItems,
    required this.tapNotifier,
    required this.scrollController,
    required this.selectedDataSetNotifier,
    required this.smallPreviewUpdateNotifier,
    required this.initialRatioWidth,
    required this.initialPreviewWidthFraction,
    required this.bodySizingNotifier,
    this.datesMaxScrollPosition,
  });

  double get pointsStep {
    if (smallPreviewUpdateNotifier.value.previewWidthFraction >= 0.99) {
      return (datesMaxScrollPosition ?? availableSize.width) / (chartItems.maxDatasetsCount);
    }

    return (datesMaxScrollPosition ?? availableSize.width) / (chartItems.maxDatasetsCount - 1);
  }

  double get infoCardMaxWidth => 0.4 * availableSize.width;

  double get chartStepScaleFactor =>
      initialPreviewWidthFraction /
      (smallPreviewUpdateNotifier.value.previewWidthFraction *
          (smallPreviewUpdateNotifier.value.previewWidthFraction > 0.5 ? 1.05 : 1.02));

  void _setFloatingHintData(Offset position, {LineChartSelectedPointDataState? state}) {
    tapNotifier.value = position;
    final index = ((scrollController.offset + position.dx) ~/ (pointsStep * chartStepScaleFactor));
    final items = chartItems.chartItemsWithDatasetAt(index);
    if (items.isNotEmpty || (items.firstOrNull?.datasets ?? []).isNotEmpty) {
      selectedDataSetNotifier.value = selectedDataSetNotifier.value.copyWith(
        chartItems: items,
        date: items.first.datasets.first.date,
        selectedDataSetIndex: index,
        state: state,
      );
    }
  }

  void _clearFloatingHintData() {
    tapNotifier.value = Offset.zero;
    selectedDataSetNotifier.value = LineChartSelectedPointData.empty();
  }

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return GestureDetector(
      onTap: () {
        if (selectedDataSetNotifier.value.state == LineChartSelectedPointDataState.keepOnScreen) return;

        _clearFloatingHintData();
      },
      onTapDown: (details) {
        LineChartSelectedPointDataState state = selectedDataSetNotifier.value.state;
        if (state == LineChartSelectedPointDataState.hide) {
          state = LineChartSelectedPointDataState.keepOnScreen;
        } else if (state == LineChartSelectedPointDataState.keepOnScreen) {
          _clearFloatingHintData();
          return;
        }
        _setFloatingHintData(details.localPosition, state: state);
      },
      onPanStart: (details) => _setFloatingHintData(details.localPosition),
      onPanUpdate: (details) => _setFloatingHintData(details.localPosition),
      onPanEnd: (details) => _clearFloatingHintData(),
      behavior: HitTestBehavior.deferToChild,
      child: SizedBox(
        width: availableSize.width,
        height: availableSize.height + SpacingFoundation.verticalSpacing16,
        child: Stack(
          clipBehavior: Clip.none,
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
                  ...chartItems
                      .medianValues(((availableSize.height ~/ SpacingFoundation.verticalSpacing16) ~/ 2) - 2)
                      .map(
                        (e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            DashedDivider(color: ColorsFoundation.darkNeutral900, availableWidth: availableSize.width),
                            Text(
                              e == '0' ? '' : e,
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
            AnimatedBuilder(
              animation: Listenable.merge([
                selectedDataSetNotifier,
                smallPreviewUpdateNotifier,
                bodySizingNotifier,
              ]),
              builder: (context, child) {
                return SizedBox(
                  width: chartStepScaleFactor > 1
                      ? (datesMaxScrollPosition ?? availableSize.width) + bodySizingNotifier.value.additionalWidth
                      : datesMaxScrollPosition ?? availableSize.width,
                  height: availableSize.height + SpacingFoundation.verticalSpacing16,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: CustomPaint(
                      isComplex: true,
                      willChange: false,
                      size: Size(
                        chartStepScaleFactor > 1
                            ? (datesMaxScrollPosition ?? availableSize.width) + bodySizingNotifier.value.additionalWidth
                            : datesMaxScrollPosition ?? availableSize.width,
                        availableSize.height + SpacingFoundation.verticalSpacing16,
                      ),
                      painter: LineChartPainterWithInfoOverlay(
                        visibleLinesIds: smallPreviewUpdateNotifier.value.visibleLinesIds,
                        pointsStraightLineColor: colorScheme?.inverseSurface ?? Colors.white,
                        stepScaleFactor: chartStepScaleFactor,
                        selectedIndex: selectedDataSetNotifier.value.selectedDataSetIndex,
                        lines: chartItems,
                        size: Size(
                          datesMaxScrollPosition ?? availableSize.width,
                          availableSize.height + SpacingFoundation.verticalSpacing16,
                        ),
                        step: pointsStep,
                      ),
                    ).paddingOnly(left: EdgeInsetsFoundation.horizontal32),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: tapNotifier,
              builder: (context, child) {
                final leftOffset = tapNotifier.value.dx + (pointsStep / 4);
                final distanceToEnd = availableSize.width - leftOffset;
                final rightOffset = availableSize.width - leftOffset;
                final showInfoCardOnLeft = rightOffset < infoCardMaxWidth;
                final approximateInfoCardHeight = (selectedDataSetNotifier.value.chartItems.length + 1) * 24.0;

                if (tapNotifier.value == Offset.zero ||
                    tapNotifier.value.dx <= pointsStep / 4 ||
                    distanceToEnd.isNegative) {
                  return const SizedBox.shrink();
                }

                return Positioned(
                  top: max(-approximateInfoCardHeight + 24, tapNotifier.value.dy - approximateInfoCardHeight),
                  left: showInfoCardOnLeft ? leftOffset - (pointsStep / 2) - infoCardMaxWidth : leftOffset,
                  child: child!,
                );
              },
              child: AnimatedBuilder(
                animation: selectedDataSetNotifier,
                builder: (context, child) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: colorScheme?.surface5,
                      borderRadius: BorderRadiusFoundation.all4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('MMM d', Localizations.localeOf(context).languageCode)
                              .format(selectedDataSetNotifier.value.date),
                          style: regularTextTheme?.caption2.copyWith(color: ColorsFoundation.mutedText),
                        ),
                        SpacingFoundation.verticalSpace2,
                        ...selectedDataSetNotifier.value.chartItems
                            .where((item) => smallPreviewUpdateNotifier.value.visibleLinesIds.contains(item.id))
                            .map(
                              (e) => Row(
                                children: [
                                  SizedBox(
                                      width: 8,
                                      height: 8,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: e.color,
                                          gradient: e.gradient,
                                          shape: BoxShape.circle,
                                        ),
                                      )).paddingAll(EdgeInsetsFoundation.all4),
                                  Text(
                                    e.chartItemName,
                                    style: regularTextTheme?.caption2.copyWith(color: colorScheme?.bodyTypography),
                                  ),
                                  SpacingFoundation.horizontalSpace2,
                                  Text(
                                    e.datasets.first.value.toStringAsFixed(0),
                                    style: regularTextTheme?.caption2.copyWith(color: colorScheme?.bodyTypography),
                                  ),
                                ],
                              ),
                            ),
                      ],
                    ).paddingAll(EdgeInsetsFoundation.all4),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
