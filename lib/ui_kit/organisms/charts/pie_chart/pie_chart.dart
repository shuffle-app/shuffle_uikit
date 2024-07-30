import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_models/charts/pie_chart_data.dart';

class UiKitPieChart extends StatelessWidget {
  final UiKitPieChartData data;

  const UiKitPieChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: UiKitPieChartPainter(data: data.items),
    );
  }
}
