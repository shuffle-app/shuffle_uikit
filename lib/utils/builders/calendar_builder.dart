import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: _CustomCalendarPickerDialog(
            lastDate: lastDate,
          )));
}

class _CustomCalendarPickerDialog extends StatefulWidget {
  final DateTime? lastDate;

  const _CustomCalendarPickerDialog({Key? key, this.lastDate})
      : super(key: key);

  @override
  State<_CustomCalendarPickerDialog> createState() =>
      _CustomCalendarPickerDialogState();
}

class _CustomCalendarPickerDialogState
    extends State<_CustomCalendarPickerDialog> {
  DateTime selectedDate = DateTime.now();

  _onSelectionChanged(DateTime selected) {
    setState(() {
      selectedDate = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.loose(Size(266.w, 380.h)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
          //TODO: add theming
          CalendarDatePicker(
            onDateChanged: _onSelectionChanged,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: widget.lastDate ??
                DateTime.now().add(const Duration(days: 365)),
          ),
          SpacingFoundation.horizontalSpace16,
          //TODO: change buttons
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            GeneralPurposeButton(
              text: 'Cancel',
              onPressed: () => context.pop(),
            ),
            GeneralPurposeButton(
              text: 'Ok',
              onPressed: () => context.pop(result: selectedDate),
            )
          ]),
        ])).paddingSymmetric(vertical: 12.h, horizontal: 12.w);
  }
}
