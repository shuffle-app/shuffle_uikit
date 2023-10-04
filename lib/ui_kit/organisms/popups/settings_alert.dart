import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<Object?> showSettingsAlert(BuildContext context, {required VoidCallback onTap, VoidCallback? onPop}) {
  return showUiKitAlertDialog(
    context,
    AlertDialogData(
      defaultButtonText: 'no, thanks',
      defaultButtonSmall: false,
      defaultButtonOutlined: true,
      onPop: onPop,
      additionalButton: const SizedBox.shrink(),
      content: context.dialogButton(
        data: BaseUiKitButtonData(onPressed: () {
          context.pop();

          return onTap.call();
        }, text: 'go to settings'),
        dialogButtonType: DialogButtonType.buttonBlack,
      ),
      title: Text(
        'To allow access to send push notifications, go to your phone settings',
        style: context.uiKitTheme?.boldTextTheme.title2.copyWith(
          color: context.uiKitTheme?.colorScheme.primary,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
