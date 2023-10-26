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
          S.of(context).ForgotPassword,
          textAlign: TextAlign.center,
          style: context.uiKitTheme?.boldTextTheme.body.copyWith(
            color: ColorsFoundation.info,
            decoration: TextDecoration.underline,
          ),
        ).paddingSymmetric(vertical: EdgeInsetsFoundation.vertical16),
      ),
      onPop: onPop,
      title: Text(
        S.of(context).ForgotPassword,
        style: context.uiKitTheme?.boldTextTheme.title2.copyWith(
          color: context.uiKitTheme?.colorScheme.primary,
        ),
        textAlign: TextAlign.center,
      ),
      defaultButtonText: S.of(context).OopsIWillTryAgain,
      defaultButtonSmall: false,
    ),
  );
}
