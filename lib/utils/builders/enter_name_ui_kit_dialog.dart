import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<void> enterNameUiKitDialog(
  BuildContext context, {
  required TextEditingController controller,
  VoidCallback? onConfirmTap,
  String? title,
  String? buttonText,
}) async {
  final theme = context.uiKitTheme;
  final colorsScheme = theme?.colorScheme;

  final FocusNode focusNode = FocusNode();

  await showUiKitAlertDialog(
    context,
    AlertDialogData(
      title: Text(
        title ?? S.current.PleaseEnterABranchTitle,
        style: theme?.boldTextTheme.title2.copyWith(
          color: colorsScheme?.inverseHeadingTypography,
        ),
        textAlign: TextAlign.center,
      ),
      content: UiKitInputFieldNoFill(
        controller: controller,
        label: S.current.Title,
        focusNode: focusNode,
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
        AnimatedBuilder(
            animation: controller,
            builder: (context, _) => context.button(
                  data: BaseUiKitButtonData(
                    backgroundColor: colorsScheme?.primary,
                    textColor: colorsScheme?.inversePrimary,
                    text: buttonText ?? S.current.Confirm,
                    onPressed: controller.text.isEmpty
                        ? null
                        : () {
                            focusNode.unfocus();
                            onConfirmTap?.call();
                          },
                  ),
                )),
      ],
      defaultButtonText: '',
    ),
  );
}
