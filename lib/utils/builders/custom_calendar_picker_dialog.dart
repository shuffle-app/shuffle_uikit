import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<DateTime?> showUiKitCalendarDialog(
  BuildContext context, {
  DateTime? lastDate,
}) {
  return showDialog<DateTime?>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: context.uiKitTheme?.cardColor,
      clipBehavior: Clip.hardEdge,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
      ),
      child: _CustomCalendarPickerDialog(
        lastDate: lastDate,
      ),
    ),
  );
}

Future<void> showUiKitCalendarFromToDialog(
  BuildContext context,
  Function(DateTime? from, DateTime? to) onConfirm, {
  DateTime? lastDate,
}) async {
  final textTheme = context.uiKitTheme?.boldTextTheme;
  final DateTime? from = await showDialog<DateTime?>(
    context: context,
    builder: (context) => Dialog(
        backgroundColor: context.uiKitTheme?.cardColor,
        clipBehavior: Clip.hardEdge,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusFoundation.all24,
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          5.h.heightBox,
          Text(
            'Select initial date',
            style: textTheme?.labelLarge,
          ),
          _CustomCalendarPickerDialog(
            lastDate: lastDate,
            okText: 'Next',
          ),
        ])),
  );

  if (from == null) return;

  final DateTime? to = await showDialog<DateTime?>(
    context: context,
    builder: (context) => Dialog(
        backgroundColor: context.uiKitTheme?.cardColor,
        clipBehavior: Clip.hardEdge,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusFoundation.all24,
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          5.h.heightBox,
          Text(
            'Select final date',
            style: textTheme?.labelLarge,
          ),
          _CustomCalendarPickerDialog(
            lastDate: lastDate,
            fromDate: from,
            cancelText: 'No end date',
            okText: 'Confirm',
          ),
        ])),
  );

  return onConfirm(from, to);
}

class _CustomCalendarPickerDialog extends StatefulWidget {
  final DateTime? lastDate;
  final DateTime? fromDate;
  final String? okText;
  final String? cancelText;

  const _CustomCalendarPickerDialog({Key? key, this.lastDate, this.fromDate, this.okText, this.cancelText})
      : super(key: key);

  @override
  State<_CustomCalendarPickerDialog> createState() => _CustomCalendarPickerDialogState();
}

class _CustomCalendarPickerDialogState extends State<_CustomCalendarPickerDialog> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.fromDate?.add(const Duration(days: 1)) ?? DateTime.now();
  }

  _onSelectionChanged(DateTime selected) {
    setState(() {
      selectedDate = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: kIsWeb
          ? BoxConstraints.loose(SizesFoundation.webCalendarPopupSize)
          : BoxConstraints.loose(SizesFoundation.standartCalendarPopupSize),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CalendarDatePicker(
            onDateChanged: _onSelectionChanged,
            initialDate: selectedDate,
            firstDate: widget.fromDate ?? DateTime.now().subtract(const Duration(days: 365)),
            lastDate: widget.lastDate ?? DateTime.now().add(const Duration(days: 365)),
          ),
          SpacingFoundation.horizontalSpace16,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              context.button(
                  data: BaseUiKitButtonData(text: widget.cancelText ?? 'Cancel', onPressed: () => context.pop()),
                  isTextButton: true),
              SpacingFoundation.horizontalSpace4,
              context.dialogButton(
                dialogButtonType: DialogButtonType.buttonWhite,
                data: BaseUiKitButtonData(
                    text: widget.okText ?? 'Ok', onPressed: () => context.pop<DateTime>(result: selectedDate)),
                small: true,
              )
            ],
          ),
        ],
      ),
    ).paddingSymmetric(
        vertical: SpacingFoundation.verticalSpacing12, horizontal: SpacingFoundation.horizontalSpacing12);
  }
}
