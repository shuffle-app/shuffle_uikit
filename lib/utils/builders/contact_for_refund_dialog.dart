import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

contactForRefundDialog({
  required BuildContext context,
  String? userName,
  VoidCallback? contactByMessageTap,
  VoidCallback? contactByEmailTap,
}) {
  final theme = context.uiKitTheme;

  return showUiKitAlertDialog(
    context,
    AlertDialogData(
      defaultButtonText: '',
      insetPadding: EdgeInsets.all(EdgeInsetsFoundation.all24),
      title: Text(
        '${S.of(context).ContactWith} $userName',
        style: theme?.boldTextTheme.title2.copyWith(
          color: theme.colorScheme.inverseHeadingTypography,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: Text(
                S.of(context).ByMessage,
                style: theme?.boldTextTheme.body.copyWith(
                  color: theme.colorScheme.inverseBodyTypography,
                ),
              ),
            ),
            context.smallOutlinedButton(
              data: BaseUiKitButtonData(
                borderColor: theme?.colorScheme.primary,
                backgroundColor: Colors.transparent,
                iconInfo: BaseUiKitButtonIconData(
                  iconData: ShuffleUiKitIcons.chevronright,
                  color: theme?.colorScheme.primary,
                ),
                onPressed: contactByMessageTap,
              ),
            )
          ],
        ),
        SpacingFoundation.verticalSpace16,
        Row(
          children: [
            Expanded(
              child: Text(
                S.of(context).ByEmail,
                style: theme?.boldTextTheme.body.copyWith(
                  color: theme.colorScheme.inverseBodyTypography,
                ),
              ),
            ),
            context.smallOutlinedButton(
              data: BaseUiKitButtonData(
                borderColor: theme?.colorScheme.primary,
                backgroundColor: Colors.transparent,
                iconInfo: BaseUiKitButtonIconData(
                  iconData: ShuffleUiKitIcons.chevronright,
                  color: theme?.colorScheme.primary,
                ),
                onPressed: contactByEmailTap,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
