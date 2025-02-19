import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitNoShowStatisticCard extends StatelessWidget {
  final int? percent;
  final bool isNoShows;
  final AutoSizeGroup? group;

  const UiKitNoShowStatisticCard({
    super.key,
    this.isNoShows = true,
    this.percent,
    this.group,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final linearColors = [
      ColorsFoundation.success,
      ColorsFoundation.yellow,
      ColorsFoundation.error,
    ];

    final currentPercent = percent ?? 0;

    final Color currentColor = isNoShows
        ? (currentPercent <= 33
            ? linearColors[0]
            : currentPercent <= 66
                ? linearColors[1]
                : linearColors[2])
        : (currentPercent <= 33
            ? linearColors[2]
            : currentPercent <= 66
                ? linearColors[1]
                : linearColors[0]);

    return UiKitCardWrapper(
      borderRadius: BorderRadiusFoundation.all12,
      color: colorScheme?.surface2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: AutoSizeText(
                  isNoShows ? S.of(context).NoShows : S.of(context).ShowUp,
                  style: theme?.boldTextTheme.caption1Bold,
                  group: group,
                  maxLines: 1,
                ),
              ),
              SpacingFoundation.horizontalSpace2,
              Builder(
                builder: (context) => GestureDetector(
                  onTap: () => showUiKitPopover(
                    context,
                    customMinHeight: 30.h,
                    showButton: false,
                    title: Text(
                      isNoShows ? S.of(context).NoShowsRatioTakesIntoAccount : S.of(context).BookingPopUpText,
                      style: theme?.regularTextTheme.body.copyWith(color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  child: ImageWidget(
                    iconData: ShuffleUiKitIcons.info,
                    width: 16.w,
                    color: colorScheme?.darkNeutral900,
                  ),
                ),
              ),
            ],
          ),
          SpacingFoundation.verticalSpace4,
          Text(
            S.of(context).Total,
            style: theme?.regularTextTheme.caption4Regular.copyWith(
              color: ColorsFoundation.mutedText,
            ),
          ),
          SpacingFoundation.verticalSpace8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientableWidget(
                gradient: GradientFoundation.attentionCard,
                child: Text(
                  '${percent ?? '0'}%',
                  style: theme?.boldTextTheme.body,
                ),
              ),
            ],
          ),
          SpacingFoundation.verticalSpace4,
          LinearProgressIndicator(
            minHeight: 4.h,
            borderRadius: BorderRadiusFoundation.all24,
            backgroundColor: colorScheme?.surface3,
            color: currentColor,
            value: percent != null ? (percent == 100 ? 1.0 : double.tryParse('0.$percent')) : 0.0,
          )
        ],
      ).paddingAll(EdgeInsetsFoundation.all12),
    );
  }
}
