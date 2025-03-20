import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

final List<String> uiKitConstWeekdays = [
  S.current.Mon,
  S.current.Tue,
  S.current.Wed,
  S.current.Thu,
  S.current.Fri,
  S.current.Sat,
  S.current.Sun,
];

Future<List<String>?> showUiKitWeekdaySelector(context) {
  final correctWeekdays = [
    S.of(context).Mon,
    S.of(context).Tue,
    S.of(context).Wed,
    S.of(context).Thu,
    S.of(context).Fri,
    S.of(context).Sat,
    S.of(context).Sun,
  ];

  return showModalBottomSheet<List<String>?>(
    backgroundColor: UiKitColors.surface4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusFoundation.all24,
    ),
    context: context,
    builder: (context) {
      final theme = context.uiKitTheme;
      const color = UiKitColors.info;

      final ValueNotifier<Set<int>> selected = ValueNotifier(<int>{});

      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpacingFoundation.verticalSpace24,
            Text(
              S.of(context).DaysOfWeek,
              style: theme?.regularTextTheme.body,
            ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
            SpacingFoundation.verticalSpace12,
            const Divider(
              color: Colors.white,
              height: 1,
            ),
            SpacingFoundation.verticalSpace12,
            ValueListenableBuilder<Set<int>>(
              valueListenable: selected,
              builder: (context, set, child) {
                return Row(
                  children: [
                    for (var day = 0; day < correctWeekdays.length; day++)
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (set.contains(day)) {
                              set.remove(day);
                            } else {
                              set.add(day);
                            }
                            selected.value = Set<int>.from(set);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  left: set.contains(day - 1) ? Radius.zero : const Radius.circular(8),
                                  right: set.contains(day + 1) ? Radius.zero : const Radius.circular(8)),
                              color: set.contains(day) ? color : null,
                            ),
                            child: Text(
                              correctWeekdays[day],
                              textAlign: TextAlign.center,
                              style: theme?.regularTextTheme.caption1,
                            ).paddingSymmetric(
                                horizontal: SpacingFoundation.horizontalSpacing2,
                                vertical: SpacingFoundation.verticalSpacing4),
                          ),
                        ),
                      )
                  ],
                ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16);
              },
            ),
            SpacingFoundation.verticalSpace16,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                context.dialogButton(
                  dialogButtonType: DialogButtonType.buttonBlack,
                  data: BaseUiKitButtonData(
                    text: S.of(context).Cancel.toUpperCase(),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SpacingFoundation.horizontalSpace16,
                context.dialogButton(
                  dialogButtonType: DialogButtonType.buttonWhite,
                  data: BaseUiKitButtonData(
                    text: S.of(context).Ok.toUpperCase(),
                    onPressed: () => Navigator.pop(
                      context,
                      [for (var i in selected.value) correctWeekdays[i]],
                    ),
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
            SpacingFoundation.verticalSpace12,
          ],
        ),
      );
    },
  );
}
