import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMiniChart extends StatefulWidget {
  final List<UiKitMiniChartData> data;

  const UiKitMiniChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<UiKitMiniChart> createState() => _UiKitMiniChartState();
}

class _UiKitMiniChartState extends State<UiKitMiniChart> {
  final ScrollController _datesScrollController = ScrollController();
  double? datesToPreviewWidthRatio;
  Size get previewSize => Size(1.sw - (72), 0.07.sh);
  Size get datesViewPortSize => Size(
        previewSize.width,
        0.0281.sh,
      );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) {
      datesToPreviewWidthRatio =
          (_datesScrollController.position.maxScrollExtent + datesViewPortSize.width) / previewSize.width;
    });
  }

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
          (e) => UiKitMiniChartDataItemWidget(data: e).paddingSymmetric(vertical: EdgeInsetsFoundation.vertical4),
        ),
        SpacingFoundation.verticalSpace8,

        /// timeline
        SizedBox.fromSize(
          size: datesViewPortSize,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            controller: _datesScrollController,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            addAutomaticKeepAlives: false,
            separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace8,
            itemBuilder: (context, index) => Text(
              '${index.toStringAsFixed(0).padLeft(2, '0')}:00',
              style: regularTextTheme?.caption2.copyWith(color: ColorsFoundation.neutral40),
            ),
            itemCount: 24,
          ),
        ),

        /// preview
        UiKitSmallMultiLineChartPreview(
          size: previewSize,
          linePainters:
              widget.data.map<CustomPainter>((e) => UiKitMiniChartPainter(data: e.items, color: e.color)).toList(),
          onScroll: (offsetValue) {
            final offset = offsetValue * (datesToPreviewWidthRatio ?? 1);
            if (offset.isInfinite) {
              _datesScrollController.animateTo(
                _datesScrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 200),
                curve: Curves.decelerate,
              );
            } else if (offset.isNaN) {
              _datesScrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.decelerate,
              );
            } else {
              _datesScrollController.jumpTo(offset);
            }
          },
        ),
      ],
    );
  }
}
