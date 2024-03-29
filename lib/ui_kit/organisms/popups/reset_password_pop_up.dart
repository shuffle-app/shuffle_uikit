import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<Object?> showResetPasswordPopUp(
  BuildContext context, {
  required TextEditingController emailController,
  required void Function(String value) onSubmitted,
  required GlobalKey<FormState> emailKey,
  String? Function(String? p1)? validator,
  VoidCallback? onPop,
}) {
  return showUiKitAlertDialog(
    context,
    AlertDialogData(
      content: Form(
        key: emailKey,
        child: UiKitInputFieldNoIcon(
          controller: emailController,
          fillColor: ColorsFoundation.lightSurface3,
          hintText: S.of(context).Email.toUpperCase(),
          validator: validator,
          hintTextColor: ColorsFoundation.darkNeutral900,
        ).paddingSymmetric(vertical: EdgeInsetsFoundation.vertical16),
      ),
      onPop: () {
        if (emailKey.currentState!.validate()) {
          onSubmitted.call(emailController.text);
          onPop != null ? onPop.call() : context.pop();
        }
      },
      title: Text(
        S.of(context).EnterYourEmailAddress,
        style: context.uiKitTheme?.boldTextTheme.title2.copyWith(
          color: context.uiKitTheme?.colorScheme.primary,
        ),
        textAlign: TextAlign.center,
      ),
      defaultButtonText: S.of(context).ResetPassword.toLowerCase(),
      defaultButtonSmall: false,
    ),
  );
}
