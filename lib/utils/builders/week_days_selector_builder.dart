import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<List<String>?> showUiKitWeekdaySelector(context) {
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

        final List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

        return SafeArea(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SpacingFoundation.verticalSpace24,
              Text(
                'Days of week',
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
                    return Row(children: [
                      for (var day = 0; day < weekdays.length; day++)
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
                                      weekdays[day],
                                      textAlign: TextAlign.center,
                                      style: theme?.regularTextTheme.caption1,
                                    ).paddingSymmetric(
                                        horizontal: SpacingFoundation.horizontalSpacing2,
                                        vertical: SpacingFoundation.verticalSpacing4))))
                    ]).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16);
                  }),
              SpacingFoundation.verticalSpace16,
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                context.dialogButton(
                    dialogButtonType: DialogButtonType.buttonBlack,
                    data: BaseUiKitButtonData(text: 'cancel'.toUpperCase(), onPressed: () => Navigator.pop(context))),
                SpacingFoundation.horizontalSpace16,
                context.dialogButton(
                    dialogButtonType: DialogButtonType.buttonWhite,
                    data: BaseUiKitButtonData(
                        text: 'ok'.toUpperCase(),
                        onPressed: () => Navigator.pop(context, [for (var i in selected.value) weekdays[i]])))
              ]).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
              SpacingFoundation.verticalSpace12,
            ]));
      });
}
