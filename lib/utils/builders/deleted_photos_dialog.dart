import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<void> deletedPhotosDialog(
  BuildContext context, {
  bool isOnePhoto = false,
  VoidCallback? onYesTap,
  VoidCallback? onCancelTap,
}) async {
  final theme = context.uiKitTheme;

  await showUiKitAlertDialog(
    context,
    AlertDialogData(
      insetPadding: EdgeInsets.all(EdgeInsetsFoundation.all32),
      title: Text(
        isOnePhoto ? S.of(context).DeleteThisPhoto : S.of(context).DeleteThesePhotos,
        style: theme?.boldTextTheme.title2.copyWith(
          color: theme.colorScheme.inverseBodyTypography,
        ),
        textAlign: TextAlign.center,
      ),
      defaultButtonText: '',
      actions: [
        context.dialogButton(
          small: true,
          dialogButtonType: DialogButtonType.buttonRed,
          data: BaseUiKitButtonData(
            text: S.of(context).Yes,
            onPressed: onYesTap,
          ),
        ),
        context.smallButton(
          data: BaseUiKitButtonData(
            text: S.current.Cancel,
            onPressed: onCancelTap,
            backgroundColor: Colors.transparent,
          ),
        )
      ],
    ),
  );
}
