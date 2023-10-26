import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<Object?> showComplaintPopUp(BuildContext context, {VoidCallback? onPop}) {
  return showUiKitAlertDialog(
    context,
    AlertDialogData(
      actions: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: context.dialogButton(
                data: BaseUiKitButtonData(
                  onPressed: onPop ?? () => context.pop(),
                  text: S.of(context).OkayCool.toLowerCase(),
                ),
                dialogButtonType: DialogButtonType.buttonBlack,
              ),
            ),
          ],
        ),
      ],
      content: Text(
        S.of(context).WeWillLetKnowResults,
        textAlign: TextAlign.center,
        style: context.uiKitTheme?.boldTextTheme.body.copyWith(
          color: context.uiKitTheme?.colorScheme.primary,
        ),
      ),
      title: Text(
        S.of(context).YourClaimHasBeenSent,
        style: context.uiKitTheme?.boldTextTheme.title2.copyWith(
          color: context.uiKitTheme?.colorScheme.primary,
        ),
        textAlign: TextAlign.center,
      ),
      defaultButtonText: '',
    ),
  );
}
