import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<void> enterNameForBranchUiKitDialog(BuildContext context, {required TextEditingController controller}) async {
  final theme = context.uiKitTheme;
  final colorsScheme = theme?.colorScheme;

  await showUiKitAlertDialog(
    context,
    AlertDialogData(
      title: Text(
        S.current.PleaseEnterABranchTitle,
        style: theme?.boldTextTheme.title2.copyWith(
          color: colorsScheme?.inverseHeadingTypography,
        ),
        textAlign: TextAlign.center,
      ),
      content: UiKitInputFieldNoFill(
        controller: controller,
        label: S.current.Title,
        customLabelColor: theme?.colorScheme.inverseBodyTypography,
        customEnabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorsScheme?.darkNeutral400 ?? ColorsFoundation.darkNeutral400,
          ),
        ),
        customFocusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorsScheme?.darkNeutral400 ?? ColorsFoundation.darkNeutral400,
          ),
        ),
        customInputTextColor: colorsScheme?.inverseHeadingTypography,
        cursorColor: colorsScheme?.inverseHeadingTypography,
      ),
      actions: [
        context.button(
          data: BaseUiKitButtonData(
            backgroundColor: colorsScheme?.primary,
            textColor: colorsScheme?.inversePrimary,
            text: S.current.Confirm,
            onPressed: () {
              context.pop();
            },
          ),
        ),
      ],
      defaultButtonText: '',
    ),
  );
}
