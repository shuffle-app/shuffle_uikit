import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

//ignore_for_file: use_build_context_synchronously

Future<TimeOfDay?> showUiKitTimeDialog(BuildContext context) {
  return showDialog<TimeOfDay?>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: context.uiKitTheme?.cardColor,
      clipBehavior: Clip.hardEdge,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
      ),
      child: TimePickerDialog(
        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
        cancelText: 'Cancel',
        confirmText: 'Ok',
      ),
    ),
  );
}

Future<void> showUiKitTimeFromToDialog(BuildContext context, Function(TimeOfDay? from, TimeOfDay? to) onConfirm) async {
  final TimeOfDay? from = await showDialog<TimeOfDay?>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: context.uiKitTheme?.cardColor,
          clipBehavior: Clip.hardEdge,
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: TimePickerDialog(
            helpText: 'Select a starting time',
            initialTime: TimeOfDay.fromDateTime(DateTime.now()),
            cancelText: 'Cancel',
            confirmText: 'Next',
          ),
        );
      });

  if (from == null) return;

  final TimeOfDay? toTime = await showDialog<TimeOfDay?>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: context.uiKitTheme?.cardColor,
          clipBehavior: Clip.hardEdge,
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: TimePickerDialog(
            helpText: 'Select an ending time',
            initialTime: TimeOfDay.fromDateTime(DateTime.now()),
            cancelText: 'No end time',
            confirmText: 'Confirm',
          ),
        );
      });

  return onConfirm(from, toTime);
}
