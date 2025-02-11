import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/utils/extentions/pie_chart_extensions.dart';

import '../../../../ui_models/charts/line_chart_small_preview_data.dart';

class UiKitPieChart extends StatelessWidget {
  final UiKitPieChartData data;
  late final ValueNotifier<Offset> tapNotifier;
  late final ValueNotifier<UiKitPieCharItemData> selectedDataSetNotifier;
  final double? renderHeight;
  final strokeWidth = 16.0;

  UiKitPieChart({super.key, required this.data, this.renderHeight}) {
    tapNotifier = ValueNotifier(Offset.zero);
    selectedDataSetNotifier = ValueNotifier(UiKitPieCharItemData.empty());
  }

  void _setFloatingHintData(Offset position, {LineChartSelectedPointDataState? state}) {
    tapNotifier.value = position;

    final Offset chartCenter = Offset((renderHeight ?? 0) / 2, (renderHeight ?? 0) / 2);
    //calculate angle of position relative to chart center
    final vectorDirection = position - chartCenter;
    double angle = atan2(vectorDirection.dy, vectorDirection.dx);
    if (angle < 0) {
      angle += 2 * pi;
    }

    debugPrint('localPosition: $position, chartCenter: $chartCenter vectorDirection: $vectorDirection, angle: $angle');
    final items = data.items.sortedByValueAsc;
    int dataIndex = 0;
    double currentAngle = 0.0;
    for (var item in items) {
      currentAngle += (item.value / items.sum) * 2 * pi;
      if (currentAngle >= angle) {
        break;
      }
      dataIndex++;
    }
    final selectedItem = items[dataIndex];
    selectedDataSetNotifier.value = selectedItem.copyWith(
      state: state,
    );
  }

  void _clearFloatingHintData() {
    tapNotifier.value = Offset.zero;
    selectedDataSetNotifier.value = UiKitPieCharItemData.empty();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final regularTextTheme = theme?.regularTextTheme;

    return Stack(alignment: Alignment.center, children: [
      GestureDetector(
          onTap: () {
            if (selectedDataSetNotifier.value.state == LineChartSelectedPointDataState.keepOnScreen) return;

            _clearFloatingHintData();
          },
          onTapDown: (details) {
            LineChartSelectedPointDataState? state = selectedDataSetNotifier.value.state;
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
          child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: ClipOval(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CustomPaint(
                    painter: UiKitPieChartPainter(data: data.items.sortedByValueAsc, strokeWidth: strokeWidth),
                  )))),
      AnimatedBuilder(
          animation: tapNotifier,
          builder: (context, child) {
            if (tapNotifier.value == Offset.zero) {
              return const SizedBox.shrink();
            }
            return child!;
          },
          child: AnimatedBuilder(
            animation: selectedDataSetNotifier,
            builder: (context, child) {
              if (selectedDataSetNotifier.value.state == LineChartSelectedPointDataState.hide) {
                return const SizedBox.shrink();
              }
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: colorScheme?.surface5,
                  borderRadius: BorderRadiusFoundation.all4,
                ),
                child: Text(
                  '${selectedDataSetNotifier.value.itemName} ${selectedDataSetNotifier.value.value.toStringAsFixed(0)}',
                  style: regularTextTheme?.caption2.copyWith(color: colorScheme?.bodyTypography),
                ).paddingAll(EdgeInsetsFoundation.all4),
              );
            },
          )),
    ]);
  }
}
