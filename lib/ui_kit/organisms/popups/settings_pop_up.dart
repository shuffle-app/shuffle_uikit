import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<Object?> showSettingsPopUp(BuildContext context, {required VoidCallback onTap, VoidCallback? onCancel}) {
  return showUiKitAlertDialog(
    context,
    AlertDialogData(
      defaultButtonText: 'no, thanks',
      defaultButtonSmall: false,
      defaultButtonOutlined: true,
      onPop: onCancel,
      additionalButton: const SizedBox.shrink(),
      content: context.dialogButton(
        data: BaseUiKitButtonData(onPressed: onTap, text: 'go to settings'),
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
