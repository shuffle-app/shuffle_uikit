import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<T?> showUiKitAlertDialog<T extends Object?>(BuildContext context,
    {VoidCallback? onPop, Widget? title, Widget? content, required String buttonText}) {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: context.uiKitTheme?.cardTheme.color,
        clipBehavior: Clip.hardEdge,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusFoundation.all24,
        ),
        titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
        title: Center(child: title),
        titleTextStyle: context.uiKitTheme?.boldTextTheme.caption2Bold,
        content: content,
        contentTextStyle: context.uiKitTheme?.boldTextTheme.body,
        contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
        actions: [
          //TODO romancores: change button to black one
          GeneralPurposeButton(
            text: buttonText,
            onPressed: onPop ?? () => context.pop(),
          )
        ],
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      );
    },
  );
}
