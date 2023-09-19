import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<Object?> showGeolocationPopUp(BuildContext context, {required VoidCallback onTap, VoidCallback? onCancel}) {
  return showUiKitAlertDialog(
    context,
    AlertDialogData(
      actions: [
        Row(
          children: [
            Expanded(
              child: context.dialogButton(
                data: BaseUiKitButtonData(onPressed: onTap, text: 'ok'),
                dialogButtonType: DialogButtonType.buttonBlack,
                small: true,
              ),
            ),
            SpacingFoundation.horizontalSpace16,
            Expanded(
              child: context.dialogButton(
                data: BaseUiKitButtonData(
                  onPressed: onCancel ?? () => context.pop(),
                  text: 'no, thx',
                ),
                dialogButtonType: DialogButtonType.buttonWhite,
                small: true,
                isOutlined: true,
              ),
            ),
          ],
        ),
      ],
      title: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            'To access all',
            style: context.uiKitTheme?.boldTextTheme.title2.copyWith(
              color: context.uiKitTheme?.colorScheme.primary,
            ),
          ),
          GradientableWidget(
            gradient: GradientFoundation.defaultLinearGradient,
            child: Text(
              ' shuffle ',
              style: context.uiKitTheme?.boldTextTheme.title2.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'features enable geolocation',
            style: context.uiKitTheme?.boldTextTheme.title2.copyWith(
              color: context.uiKitTheme?.colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      defaultButtonText: '',
    ),
  );
}
