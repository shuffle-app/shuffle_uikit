import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<dynamic> timePickerDialog(
  BuildContext context, {
  List<TimeOfDay>? times,
  DateTime? selectedDate,
  ValueChanged<TimeOfDay?>? onTimeSelected,
  List<TimeRange>? timeRange,
}) {
  return showUiKitAlertDialog(
    context,
    AlertDialogData(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      customBackgroundColor: context.uiKitTheme?.colorScheme.surface4,
      defaultButtonText: '',
      content: SizedBox(
        width: 0.9.sw,
        child: SelectTimeFromRange(
          selectedDate: selectedDate,
          times: times,
          onTimeSelected: onTimeSelected,
          timeRange: timeRange,
        ),
      ),
    ),
  );
}

class SelectTimeFromRange extends StatefulWidget {
  final List<TimeOfDay>? times;
  final DateTime? selectedDate;
  final ValueChanged<TimeOfDay?>? onTimeSelected;
  final List<TimeRange>? timeRange;

  const SelectTimeFromRange({
    super.key,
    this.times,
    this.selectedDate,
    this.onTimeSelected,
    this.timeRange,
  });

  @override
  State<SelectTimeFromRange> createState() => SelectTimeFromRangeState();
}

class SelectTimeFromRangeState extends State<SelectTimeFromRange> {
  final horizontalSpacing = SpacingFoundation.horizontalSpacing16;
  TimeOfDay? selectedTime;
  late final List<TimeOfDay>? _sortedTimes;

  @override
  void initState() {
    super.initState();
    _sortedTimes = (widget.times)
      ?..sort((a, b) {
        final hourCompare = b.hour.compareTo(a.hour);
        return hourCompare != 0 ? hourCompare : b.minute.compareTo(a.minute);
      });
  }

  @override
  Widget build(BuildContext context) {
    final timeRangeIsNotEmpty = widget.timeRange != null && widget.timeRange!.isNotEmpty;
    final theme = context.uiKitTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        18.h.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
                child: AutoSizeText(
              formatDateWithCustomPattern('dd.MM.yyyy', widget.selectedDate ?? DateTime.now()),
              style: theme?.regularTextTheme.caption2.copyWith(color: ColorsFoundation.mutedText),
            )),
          ],
        ).paddingSymmetric(horizontal: horizontalSpacing),
        SpacingFoundation.verticalSpace8,
        Row(
          children: [
            Flexible(
                child: AutoSizeText(
              S.of(context).Time,
              style: theme?.regularTextTheme.body,
            )),
          ],
        ).paddingSymmetric(horizontal: horizontalSpacing),
        SpacingFoundation.verticalSpace12,
        Divider(
          indent: 2.w,
          color: ColorsFoundation.neutral16,
        ),
        SpacingFoundation.verticalSpace12,
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: timeRangeIsNotEmpty ? widget.timeRange?.length : _sortedTimes?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: timeRangeIsNotEmpty ? 2 : 4,
            crossAxisSpacing: SpacingFoundation.horizontalSpacing8,
            mainAxisSpacing: SpacingFoundation.horizontalSpacing8,
            mainAxisExtent: 40.w,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                setState(() {
                  selectedTime = widget.timeRange?[index].start ?? _sortedTimes?[index];
                });
              },
              child: UiKitCardWrapper(
                borderRadius: BorderRadiusFoundation.all8,
                color: selectedTime == (widget.timeRange?[index].start ?? _sortedTimes?[index])
                    ? ColorsFoundation.deepPurple
                    : ColorsFoundation.neutral16,
                child: Center(
                  child: AutoSizeText(
                    _sortedTimes?[index] != null
                        ? normalizedTi(_sortedTimes?[index], showDateName: false)
                        : widget.timeRange?[index].formatted() ?? '',
                    style: theme?.boldTextTheme.caption1Bold,
                    maxLines: 1,
                  ).paddingSymmetric(
                    horizontal: SpacingFoundation.horizontalSpacing4,
                    vertical: SpacingFoundation.verticalSpacing8,
                  ),
                ),
              ),
            );
          },
        ).paddingSymmetric(horizontal: horizontalSpacing),
        SpacingFoundation.verticalSpace12,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            context.smallButton(
              data: BaseUiKitButtonData(
                backgroundColor: theme?.colorScheme.surface4,
                text: S.of(context).Cancel,
                textColor: theme?.colorScheme.inversePrimary,
                onPressed: () {
                  context.pop();
                },
              ),
            ),
            context.smallButton(
              data: BaseUiKitButtonData(
                text: S.of(context).Ok,
                onPressed: () {
                  widget.onTimeSelected?.call(selectedTime);
                },
              ),
            )
          ],
        ).paddingSymmetric(horizontal: horizontalSpacing),
        18.h.heightBox,
      ],
    );
  }
}
