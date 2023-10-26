import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<Object?> showGeolocationAlert(BuildContext context, {required VoidCallback onTap, VoidCallback? onPop}) {
  return showUiKitAlertDialog(
    context,
    AlertDialogData(
      actions: [
        Row(
          children: [
            Expanded(
              child: context.dialogButton(
                data: BaseUiKitButtonData(onPressed: onTap, text: S.of(context).Ok.toLowerCase()),
                dialogButtonType: DialogButtonType.buttonBlack,
                small: true,
              ),
            ),
            SpacingFoundation.horizontalSpace16,
            Expanded(
              child: context.dialogButton(
                data: BaseUiKitButtonData(
                  onPressed: onPop ?? () => context.pop(),
                  text: S.of(context).NoThx.toLowerCase(),
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
            S.of(context).ToAccessAll,
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
            S.of(context).FeaturesEnableGeolocation.toLowerCase(),
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
