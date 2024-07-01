import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/molecules/decoration/dashed_divider.dart';
import 'package:shuffle_uikit/ui_kit/organisms/charts/painters/line_chart_painters.dart';
import 'package:shuffle_uikit/ui_models/charts/chart_data.dart';
import 'package:shuffle_uikit/utils/extentions/chart_extensions.dart';

class UiKitLineChartBody extends StatelessWidget {
  final Size availableSize;
  final List<UiKitLineChartItemData<num>> chartItems;
  final ScrollController? scrollController;
  final double? datesMaxScrollPosition;

  const UiKitLineChartBody({
    Key? key,
    required this.availableSize,
    required this.chartItems,
    this.datesMaxScrollPosition,
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
                  datesMaxScrollPosition ?? availableSize.width,
                  availableSize.height + SpacingFoundation.verticalSpacing16,
                ),
                painter: LineChartPainter(
                  lines: chartItems,
                  size: Size(
                    datesMaxScrollPosition ?? availableSize.width,
                    availableSize.height + SpacingFoundation.verticalSpacing16,
                  ),
                ),
              ).paddingOnly(left: EdgeInsetsFoundation.horizontal32),
            ),
          ),
        ],
      ),
    );
  }
}
