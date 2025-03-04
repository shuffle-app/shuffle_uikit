import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<void> createPhotoDialog(
  BuildContext context, {
  required TextEditingController controller,
  VoidCallback? onYesTap,
  VoidCallback? onCancelTap,
  bool isLoading = false,
}) async {
  final theme = context.uiKitTheme;
  final colorsScheme = theme?.colorScheme;

  final formKey = GlobalKey<FormState>();

  await showUiKitAlertDialog(
    context,
    AlertDialogData(
      defaultButtonText: '',
      title: Text(
        S.current.PhotoTitle,
        style: theme?.boldTextTheme.title2.copyWith(
          color: colorsScheme?.inverseBodyTypography,
        ),
        textAlign: TextAlign.center,
      ),
      content: isLoading
          ? CircularProgressIndicator.adaptive()
          : Form(
              key: formKey,
              child: SizedBox(
                width: 0.75.sw,
                child: UiKitInputFieldNoFill(
                  controller: controller,
                  label: S.current.Title,
                  maxSymbols: 25,
                  customLabelColor: colorsScheme?.inverseBodyTypography,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.current.AddTitle;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    formKey.currentState?.validate();
                  },
                ),
              ),
            ),
      actions: isLoading
          ? null
          : [
              context.dialogButton(
                small: true,
                dialogButtonType: DialogButtonType.buttonBlack,
                data: BaseUiKitButtonData(
                  text: S.of(context).Yes,
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) onYesTap?.call();
                  },
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
