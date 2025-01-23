import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

uploadReviewDialog(BuildContext context, {VoidCallback? onTap, String? text}) {
  final theme = context.uiKitTheme;

  return showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: theme?.colorScheme.inversePrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(EdgeInsetsFoundation.all24),
      ),
      insetPadding: EdgeInsets.all(EdgeInsetsFoundation.all16),
      child: SizedBox(
        width: 0.75.sw,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              text ?? S.current.FeedbackAddedSuccessfullyMessage,
              style: theme?.boldTextTheme.title2.copyWith(
                color: theme.colorScheme.surface,
              ),
              textAlign: TextAlign.center,
            ),
            SpacingFoundation.verticalSpace24,
            context.dialogButton(
              dialogButtonType: DialogButtonType.buttonBlack,
              data: BaseUiKitButtonData(
                text: S.current.OkayCool,
                onPressed: onTap,
              ),
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all24),
      ),
    ),
  );
}
