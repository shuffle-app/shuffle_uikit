import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

//ignore_for_file: use_build_context_synchronously

/// Shows a UIKit-style calendar dialog.
///
/// The dialog allows the user to select a date, and returns the selected date to the caller.
///
/// The dialog is displayed as a modal dialog.
///
/// The dialog uses the current theme of the application, as specified by [BuildContext.uiKitTheme].
///
/// The dialog can be customized by providing the following optional arguments:
///
/// - [lastDate]: The last date that can be selected in the calendar. By default, this is set to one year from [DateTime.now].
/// - [firstDate]: The first date that can be selected in the calendar. By default, this is set to one year before [DateTime.now].
///
/// The function returns a [Future] that completes with the selected date, or null if the dialog is cancelled.

Future<DateTime?> showUiKitCalendarDialog(BuildContext context,
    {DateTime? lastDate, DateTime? firstDate, bool Function(DateTime day)? selectableDayPredicate}) {
  final colorScheme = context.uiKitTheme?.colorScheme;
  return showDialog<DateTime?>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: context.uiKitTheme?.cardColor,
      clipBehavior: Clip.hardEdge,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          datePickerTheme: Theme.of(context).datePickerTheme.copyWith(
            dayForegroundColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return colorScheme?.darkNeutral500 ?? Colors.white;
              }

              return colorScheme?.inverseSurface ?? Colors.white;
            }),
          ),
        ),
        child: _CustomCalendarPickerDialog(
          lastDate: lastDate,
          firstDate: firstDate,
          selectableDayPredicate: selectableDayPredicate,
        ),
      ),
    ),
  );
}

/// Shows a UIKit-style calendar dialog that allows the user to select a date range.
///
/// The dialog displays a calendar for selecting the initial date, and another calendar for selecting the final date.
///
/// The dialog is displayed as a modal dialog.
///
/// The dialog uses the current theme of the application, as specified by [BuildContext.uiKitTheme].
///
/// The dialog can be customized by providing the following optional arguments:
///
/// - [lastDate]: The last date that can be selected in the calendar. By default, this is set to one year from the current date.
///
/// The function returns nothing. [onConfirm] will return a selected date range, or null if the dialog is cancelled on the first calendar.

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

  final DateTime? toTime = await showDialog<DateTime?>(
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
            firstDate: from,
            cancelText: 'No end date',
            okText: 'Confirm',
          ),
        ])),
  );

  return onConfirm(from, toTime);
}

class _CustomCalendarPickerDialog extends StatefulWidget {
  final DateTime? lastDate;
  final DateTime? firstDate;
  final String? okText;
  final String? cancelText;
  final bool Function(DateTime day)? selectableDayPredicate;

  const _CustomCalendarPickerDialog(
      {this.firstDate, this.lastDate, this.okText, this.cancelText, this.selectableDayPredicate});

  @override
  State<_CustomCalendarPickerDialog> createState() => _CustomCalendarPickerDialogState();
}

class _CustomCalendarPickerDialogState extends State<_CustomCalendarPickerDialog> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.firstDate ?? DateTime.now();
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
            selectableDayPredicate: widget.selectableDayPredicate,
            onDateChanged: _onSelectionChanged,
            initialDate: selectedDate,
            firstDate: widget.firstDate ?? DateTime.now().subtract(const Duration(days: 365)),
            lastDate: widget.lastDate ?? DateTime.now().add(const Duration(days: 365)),
          ),
          SpacingFoundation.horizontalSpace16,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              context.button(
                data: BaseUiKitButtonData(
                  text: widget.cancelText ?? S.current.Cancel,
                  onPressed: () => context.pop(),
                ),
                isTextButton: true,
              ),
              SpacingFoundation.horizontalSpace4,
              context.dialogButton(
                dialogButtonType: context.uiKitTheme?.themeMode == ThemeMode.dark
                    ? DialogButtonType.buttonWhite
                    : DialogButtonType.buttonBlack,
                data: BaseUiKitButtonData(
                  text: widget.okText ?? S.current.Ok,
                  onPressed: () => context.pop<DateTime>(result: selectedDate),
                ),
                small: true,
              ),
            ],
          ),
        ],
      ),
    ).paddingSymmetric(
        vertical: SpacingFoundation.verticalSpacing12, horizontal: SpacingFoundation.horizontalSpacing12);
  }
}
