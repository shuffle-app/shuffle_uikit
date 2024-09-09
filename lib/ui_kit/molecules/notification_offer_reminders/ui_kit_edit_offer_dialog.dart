import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

uiKitEditOfferDialog(
  BuildContext context,
  VoidCallback onOkayTap,
) {
  final theme = context.uiKitTheme;

  return showUiKitAlertDialog(
    context,
    AlertDialogData(
      insetPadding: EdgeInsets.symmetric(horizontal: SpacingFoundation.horizontalSpacing16),
      title: Text(
        S.of(context).YourOfferHasAlreadyBeenPublishedToYourAudience,
        style: theme?.boldTextTheme.title2.copyWith(color: theme.colorScheme.primary),
        textAlign: TextAlign.center,
      ),
      defaultButtonText: '',
      actions: [
        Row(
          children: [
            Expanded(
              child: context.outlinedButton(
                data: BaseUiKitButtonData(
                  backgroundColor: theme?.colorScheme.primary,
                  textColor: theme?.colorScheme.inversePrimary,
                  onPressed: onOkayTap,
                  text: S.of(context).Okay,
                ),
              ),
            ),
            Expanded(
              child: context.outlinedButton(
                data: BaseUiKitButtonData(
                  text: S.of(context).Cancel,
                  textColor: theme?.colorScheme.primary,
                  onPressed: () => context.pop(),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
