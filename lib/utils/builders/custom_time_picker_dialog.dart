import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

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
        cancelText: 'Cacel',
        confirmText: 'Ok',
      ),
    ),
  );
}
