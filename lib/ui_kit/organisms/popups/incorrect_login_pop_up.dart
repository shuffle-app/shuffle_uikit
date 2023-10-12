import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<Object?> showIncorrectLoginPopUp(
  BuildContext context, {
  required VoidCallback onForgotPasswordTap,
  VoidCallback? onPop,
}) {
  return showUiKitAlertDialog(
    context,
    AlertDialogData(
      content: GestureDetector(
        onTap: onForgotPasswordTap,
        child: Text(
          'Forgot password',
          textAlign: TextAlign.center,
          style: context.uiKitTheme?.boldTextTheme.body.copyWith(
            color: ColorsFoundation.info,
            decoration: TextDecoration.underline,
          ),
        ).paddingSymmetric(vertical: EdgeInsetsFoundation.vertical16),
      ),
      onPop: onPop,
      title: Text(
        'Incorrect login or password',
        style: context.uiKitTheme?.boldTextTheme.title2.copyWith(
          color: context.uiKitTheme?.colorScheme.primary,
        ),
        textAlign: TextAlign.center,
      ),
      defaultButtonText: "Oops, I'll try again",
      defaultButtonSmall: false,
    ),
  );
}
